# Load libraries necessary to run script. See renv.lock for dependencies
library(tidyverse)
library(DBI)
library(odbc)
library(ccao)
library(assessr)
library(glue)
library(sf)
library(imputeTS)


setwd(paste0("C:/Users/", Sys.info()[["user"]], "/Documents/ccao_reS_avm"))

out.folder <- "R"

##### Gather Data #####
# Connect to main CCAO database
CCAODATA <- dbConnect(
  odbc(),
  .connection_string = Sys.getenv("DB_CONFIG_CCAODATA")
)

# Latest year in the data with finalized property characteristics. Will look for
# comparable sales that also occurred in this year
year_of_interest <- 2019

# Gather the universe of residential PINs within a 5 year period
universe <- dbGetQuery(
  CCAODATA,
  glue_sql(
    "
    SELECT *
    FROM VW_RES_UNIVERSE
    WHERE TAX_YEAR = {year_of_interest}
    ",
    .con = CCAODATA
  )
)

# Gather sales to be joined to corresponding PIN and year
sales <- dbGetQuery(
  CCAODATA,
  glue_sql(
    "
    SELECT PIN, TAX_YEAR, sale_price, DOC_NO
    FROM VW_CLEAN_IDORSALES
    WHERE TAX_YEAR BETWEEN {year_of_interest - 2} AND {year_of_interest}
    AND sale_price >= 10000
    ",
    .con = CCAODATA
  )
) 

# Gather property physical location
pinlocs <- dbGetQuery(
  CCAODATA,
  "
  SELECT PIN, centroid_x AS geo_longitude, centroid_y AS geo_latitude
  FROM VW_PINGEO
  "
)



##### Prepare Data #####

prepped <- universe %>%
  # Remove all properties with no characteristics
  filter(!CLASS %in% c(299, 399)) %>%
  # Remove duplicate/multicode PINs
  group_by(PIN, TAX_YEAR) %>%
  filter(n() == 1) %>%
  # Joins sales for each PIN and TAX_YEAR
  left_join(sales, by = c("PIN", "TAX_YEAR")) %>%
  # Keep only the variables used for clustering (except sale price, which is
  # removed later)
  
  left_join(pinlocs, by = "PIN") %>%
  ungroup() %>%
  ccao::vars_rename() %>%
  select(
    meta_pin, meta_sale_price, char_bldg_sf, char_age, char_rooms, char_beds,
    char_air, char_bsmt, char_bsmt_fin, char_ext_wall, char_heat, char_gar1_size,
    geo_longitude, geo_latitude, meta_year, meta_town_code, meta_document_num
  ) %>%
  # Convert categorical variables to factor and numbers to numeric
  mutate(
    across(c(meta_sale_price:char_beds, geo_longitude, geo_latitude), as.numeric),
    across(char_air:char_gar1_size, as.factor),
    char_age = ccao::chars_fix_age(char_age, as.numeric(meta_year), meta_town_code)
  ) %>%
  select(-meta_year, -meta_town_code) %>%
  # Recode factor vars and encode missing
  ccao::vars_recode(type = "code") %>%
  mutate(across(where(is.factor), fct_explicit_na)) %>%
  # Convert lat/lon to planar projection. In the case of Illinois, 3435 is ideal
  # This code converts to the new coordinate system, but immediately removes the
  # resulting geometry column (only the coordinates are needed)
  st_as_sf(coords = c("geo_longitude", "geo_latitude"), crs = 4326) %>%
  st_transform(3435) %>%
  mutate(
    geo_longitude = st_coordinates(.)[, 1],
    geo_latitude = st_coordinates(.)[, 2]
  ) %>%
  st_set_geometry(NULL)



##### Create Initial Clusters #####

prepped_sales <- prepped %>%
  filter(!is.na(meta_sale_price), !is.na(char_beds))

# Set arbitrary relative weights, unspecified vars = 1
weights <- c("char_bldg_sf" = 8, "char_age" = 4, "char_ext_wall" = 2)

# Set the number of potential clusters to try
num_clusts <- 2:12

# Loop through different values of m, outputting the results to a list
clusts <- lapply(num_clusts, function(m) {
  assessr::cknn(
    data = prepped_sales %>%
      select(-meta_pin, -meta_sale_price, -geo_longitude, -geo_latitude, -meta_document_num),
    lon = prepped_sales %>% pull(geo_longitude),
    lat = prepped_sales %>% pull(geo_latitude),
    var_weights = weights,
    m = m,
    k = 10,
    l = 0.5
  )
})

# Elbow plot of total sum square dists * number of clusters
data.frame(
  m = num_clusts,
  ss = sapply(clusts, function(x) x$kproto$tot.withinss)
) %>%
  ggplot() +
  geom_line(aes(x = m, y = ss), size = 1.2, color = "blue") +
  labs(x = "# of Clusters", y = "Total Sum Square Dists") +
  theme_minimal()

# Choose the best m according to the elbow plot. Clustering starts at 2,
# so m minus 1 is best number of clusters. We're choosing m = 8
best_clust <- clusts[[10 - 1]]



##### Finding Comparables #####

# Select a random subset of sold and unsold properties
prepped_sample <- prepped %>%
  filter(!is.na(char_beds)) %>%
  sample_n(10000)

# Find the set of cluster memberships and comparables for each sample property
comparables <- predict(
  best_clust,
  newdata = prepped_sample %>%
    select(-meta_pin, -meta_sale_price, -geo_longitude, -geo_latitude, -meta_document_num),
  lon = prepped_sample %>% pull(geo_longitude),
  lat = prepped_sample %>% pull(geo_latitude),
  k = 11
)

# Attach comparables to the sample properties
comparables_df <- prepped_sample %>%
  mutate(comps = comparables$knn) %>%
  unnest(comps) %>%
  left_join(
    prepped_sales %>%
      select(comp_pin = meta_pin, comp_sale_price = meta_sale_price, comp_doc_no = meta_document_num) %>%
      mutate(comps = row_number()),
    by = "comps"
  ) %>%
  select(
    target_pin = meta_pin,
    target_sale_price = meta_sale_price,
    comp_pin,
    comp_sale_price,
    comp_doc_no
  ) %>%
  filter(target_pin != comp_pin)

save(comparables_df, file=paste0(out.folder, '/comparables_df.Rda'))

chars <- dbGetQuery(
  CCAODATA,
  "SELECT A.PIN, A.ROOMS, A.BSMT_FIN, A.ATTIC_FNSH, A.HBATH,A.FBATH,A.BLDG_SF, B.[FIRST PASS] FROM CCAOSFCHARS A JOIN VW_OPENDATA_ASSESSMENTS B ON A.PIN = B.PIN WHERE A.TAX_YEAR = 2019 AND B.YEAR = 2019"

)

save(chars, file=paste0(out.folder, '/chars.Rda'))

# Disconnect DB connection
dbDisconnect(CCAODATA)

# ------------------------------------------------------------------------------------------  break

load(paste0(out.folder, '/comparables_df.Rda'))
load(paste0(out.folder, '/chars.Rda'))

df_merged <- merge(comparables_df, chars, by.x = 'target_pin', by.y = 'PIN')%>%
  ccao::vars_rename()
df_merged2 <- merge(df_merged, chars, by.x='comp_pin', by.y='PIN')
data2 <- df_merged2[,c('target_pin', 'target_sale_price','char_rooms', 'char_bsmt_fin','char_attic_fnsh', 
                           'char_hbath', 'char_fbath','char_bldg_sf','FIRST PASS.x','comp_pin','comp_sale_price','comp_doc_no', 
                           'ROOMS', 'BSMT_FIN','ATTIC_FNSH','HBATH','FBATH','BLDG_SF','FIRST PASS.y')]

similar_iden_data <- data2  %>% 
  mutate(sqft_diff = char_bldg_sf/BLDG_SF) %>% 
  mutate(vir_identical = ifelse(char_rooms == ROOMS &
                                  char_fbath == FBATH &
                                  char_hbath == HBATH & 
                                  sqft_diff <= 1.05 & 
                                  sqft_diff >= 0.95 & 
                                  char_bsmt_fin == BSMT_FIN & 
                                  char_attic_fnsh == ATTIC_FNSH, 1, 0)) %>% 
  mutate(similar = ifelse(sqft_diff <= 1.1 & 
                            sqft_diff >= 0.9 & 
                            (char_fbath <= FBATH + 1 & char_fbath >= FBATH - 1), 1, 0))


###########################################################################################################
# Guildline O: A reduction is warranted if the fair cash value of the subject property is greater than or #
# equal to 1.15 times the median of its comparable sales distribution.                                    #
###########################################################################################################

guid_o <- similar_iden_data %>% 
  group_by(target_pin) %>% 
  summarise(comp_sale_med=median(comp_sale_price, na.rm = TRUE), tar_fmv=mean(`FIRST PASS.x`)) %>% 
  mutate(ratio=tar_fmv/comp_sale_med)

quantile(guid_o$ratio, probs = c(0.05, 0.81, 1))
# Result: 19% samples satisfy this guideline.

###########################################################################################################
# Guildline OD: A reduction is warranted if there are two similar property sale values less than or equal #
# to .95 times the subject property's fair cash value, and one own-property sale value less than or equal #
# to .95 times the subject property's fair cash value.                                                    #
###########################################################################################################

guid_od <- similar_iden_data %>% 
  mutate(ratio_comp = comp_sale_price/`FIRST PASS.x`) %>% 
  mutate(ratio_own = target_sale_price/`FIRST PASS.x`)%>%
  mutate(is_95_per = ifelse(similar == 1 & ratio_comp <= .95, 1, 0)) %>% 
  mutate(is_95_per_own = ifelse(ratio_own <= 0.95,1,0))%>%
  group_by(target_pin)%>%
  summarise(n_satisfy = sum(is_95_per), own_satisfy = is_95_per_own)%>%
  mutate(satisfy = ifelse(n_satisfy >= 2 & own_satisfy == 1, n_satisfy + own_satisfy,0))
quantile(guid_od$satisfy, probs = c(0, 0.965, 1), na.rm=TRUE)
# Result: 3.5% samples satisfy this guideline.

#######################################################################################################
# Guildline OD: A reduction is warranted if there is one virtually identical property sale value less #
# than or equal to .95 times the subject property's fair cash value, and one own-property sale value  #
# less than or equal to .95 times the subject property's fair cash value.                             #
#######################################################################################################

guid_od2 <- similar_iden_data %>% 
  mutate(ratio_comp = comp_sale_price/`FIRST PASS.x`) %>% 
  mutate(ratio_own = target_sale_price/`FIRST PASS.x`)%>%
  mutate(is_95_per = ifelse(vir_identical == 1 & ratio_comp <= .95, 1, 0)) %>% 
  mutate(is_95_per_own = ifelse(ratio_own <= 0.95,1,0))%>%
  group_by(target_pin)%>%
  summarise(n_satisfy = sum(is_95_per), own_satisfy = is_95_per_own)%>%
  mutate(satisfy = ifelse(n_satisfy >= 1 & own_satisfy == 1, n_satisfy + own_satisfy,0))
quantile(guid_od2$satisfy, probs = c(0, 0.997, 1), na.rm=TRUE)
# Result: 0.3% samples satisfy this guideline.

########################################################################################################
# Guildline OA: A reduction is warranted if there are at least three virtually identical property sale #
# values less than or equal to .95 times the subject property's fair cash value.                       #
########################################################################################################

guid_oa <- similar_iden_data %>% 
  mutate(ratio_comp = comp_sale_price/`FIRST PASS.x`) %>% 
  mutate(is_95_per = ifelse(vir_identical == 1 & ratio_comp <= .95, 1, 0)) %>% 
  group_by(target_pin) %>% 
  summarise(n_satisfy = sum(is_95_per))
quantile(guid_oa$n_satisfy, probs = c(0.5, 0.972, 1))
# Result: 2.8% samples satisfy this guideline

#################################################################################################
# Guildline OB: A reduction is warranted if there are at least six similar properties with sale #
# prices less than or equal to .90 times the subject property's fair cash value.                #
#################################################################################################

guid_ob <- similar_iden_data %>% 
  mutate(ratio_comp = comp_sale_price/`FIRST PASS.x`) %>% 
  mutate(is_95_per = ifelse(similar == 1 & ratio_comp <= .90, 1, 0)) %>% 
  group_by(target_pin) %>% 
  summarise(n_satisfy = sum(is_95_per))
quantile(guid_ob$n_satisfy, probs = c(0, 0.872, 1))
# Result: 12.8% samples satisfy this guideline
