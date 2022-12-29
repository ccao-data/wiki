# ---- Setup ----

# Load the necessary libraries
library(ggpubr)
library(DBI)
library(ggplot2)
library(gridExtra)
library(htmltools)
library(htmlwidgets)
library(jsonlite)
library(knitr)
library(leaflet)
library(lubridate)
library(odbc)
library(readr)
library(readxl)
library(RSocrata)
library(scales)
library(sf)
library(stargazer)
library(testit)
library(tidyr)
library(tidyverse)
library(writexl)
library(DT)
library(margins)
library(dplyr)
library(ccao)

setwd(paste0("C:/Users/", Sys.info()[["user"]], "/Documents/ccao_reS_avm"))

out.folder <- "R"

# ------------------------------------------------------------------------------------------  break

CCAODATA <- dbConnect(
odbc(),
.connection_string = Sys.getenv("DB_CONFIG_CCAODATA")
)

##### Fetch data ---------------------------------------------------------------------------

data <- dbGetQuery(CCAODATA, paste0("
WITH CHAR_SET AS (
SELECT T.PIN,
T.HD_CLASS AS CLASS,
T.TAX_YEAR,
LEFT(T.HD_TOWN, 2) AS TOWN,
T.HD_NBHD AS NBHD,
CHARS.BLDG_SF AS BLDG_SF,
CHARS.HD_SF AS LND_SF,
CHARS.AGE,
CHARS.FBATH,
CHARS.HBATH,
CHARS.AIR,
CHARS.SITE,
CHARS.ROOF_CNST,
CHARS.GAR1_SIZE,
CHARS.FRPL,
CHARS.BSMT,
CHARS.BSMT_FIN,
CHARS.PORCH,
CHARS.EXT_WALL,
CHARS.HEAT,
(T.HD_ASS_BLD + T.HD_ASS_LND) AS ASSMNT_VAL,
(T.HD_ASS_BLD / CHARS.BLDG_SF) * 10 AS DOLLAR_SQFT,
T.HD_SPRICE AS SALE_VAL,
T.HD_SDATE AS SALE_DATE,
ROW_NUMBER() OVER(PARTITION BY LEFT(T.HD_TOWN, 2) ORDER BY NEWID()) AS rand_id
FROM AS_HEADT T
INNER JOIN (
SELECT PIN, MAX(TAX_YEAR) as most_recent_year
FROM AS_HEADT
GROUP BY PIN
) A ON A.PIN = T.PIN AND A.most_recent_year = T.TAX_YEAR
INNER JOIN CCAOSFCHARS AS CHARS
ON CHARS.PIN = T.PIN AND CHARS.TAX_YEAR = 2019
)
SELECT
A.rand_id AS TARGET_GROUP_ID,
A.PIN AS TARGET_PIN,
A.SALE_VAL AS TARGET_SALE_VAL,
A.SALE_DATE AS TARGET_SALE_DATE,
A.ASSMNT_VAL * 10 AS TARGET_FMV,
B.PIN AS COMP_PIN,
B.SALE_VAL AS COMP_SALE_VAL,
B.SALE_DATE AS COMP_SALE_DATE,
B.ASSMNT_VAL * 10 AS COMP_FMV
FROM (
SELECT *
FROM CHAR_SET
WHERE rand_id <= 1000
) A
LEFT JOIN CHAR_SET AS B
ON A.PIN != B.PIN
AND A.TOWN = B.TOWN
AND A.NBHD = B.NBHD
AND A.CLASS = B.CLASS
AND A.EXT_WALL = B.EXT_WALL
AND B.BLDG_SF BETWEEN (A.BLDG_SF - (A.BLDG_SF * 0.15)) AND (A.BLDG_SF + (A.BLDG_SF * 0.15))
AND B.LND_SF BETWEEN (A.LND_SF - (A.LND_SF * 0.15)) AND (A.LND_SF + (A.LND_SF * 0.15))
AND B.AGE BETWEEN (A.AGE - (A.AGE * 0.15)) AND (A.AGE + (A.AGE * 0.15))
AND B.DOLLAR_SQFT BETWEEN (A.DOLLAR_SQFT - (A.DOLLAR_SQFT * 0.15)) AND (A.DOLLAR_SQFT + (A.DOLLAR_SQFT * 0.15))
ORDER BY TARGET_PIN DESC
"))

  save(data, file=paste0(out.folder, '/uniformity.Rda'))

  # Disconnect DB connection
  dbDisconnect(CCAODATA)

  # ------------------------------------------------------------------------------------------  break

#---- Load data ----
load(paste0(out.folder, '/uniformity.Rda'))

#---- Make graph ---
  g_data_1 <- data %>%
    dplyr::filter(!is.na(COMP_PIN)) %>%
    dplyr::group_by(TARGET_PIN) %>%
    dplyr::summarise(comp_n = n(), comp_median = median(COMP_FMV), target_fmv = mean(TARGET_FMV)) %>%
    dplyr::mutate(per_from_median = plyr::round_any((target_fmv-comp_median)/comp_median, .01)) %>%
    dplyr::group_by(per_from_median) %>%
    dplyr::summarise(
      `Mean Number of Comps` = mean(comp_n)
      , `Number of PINs` = n()) %>%
    dplyr::filter(per_from_median <= .20, per_from_median > 0) %>%
    dplyr::rename('Ratio of median' = 'per_from_median') %>%
    dplyr::mutate(`Ratio of median` = 1 + `Ratio of median`
                  , `Share of PINs` = `Number of PINs` / sum(`Number of PINs`)
                  , `Cumulative share of PINs` = cumsum( `Number of PINs`)/ sum(`Number of PINs`))

g_data_1 %>% ggplot(aes(x=`Ratio of median`, y=`Cumulative share of PINs`)) +
  geom_line(color = ccao::ccao_colors$navy) + geom_point(color = ccao::ccao_colors$navy) +
  scale_y_continuous(labels = scales::percent_format()) +
  scale_x_continuous(labels = scales::percent_format()) +
  theme_minimal() +
  geom_vline(xintercept = 1.1, linetype = 'dashed') + geom_hline(yintercept = 0.9198170, linetype = 'dashed') +
  labs(title = "Cumulative count of PINs by ratio of comparables distribution median")

save(data, file=paste0(out.folder, '/res_appeals_graph_data_1.Rda'))


data1 <- data %>%
  filter(!is.na(COMP_PIN))
quantile(data1$TARGET_FMV, probs = c(0, 0.2, 0.4, 0.6, 0.8, 1))

g_data_2 <- data %>%
  filter(!is.na(COMP_PIN)) %>%
  mutate(`Fair Cash Value` = case_when(
    between(TARGET_FMV, 0, 148350) ~ "$0k - $148k",
    between(TARGET_FMV, 148351, 191420) ~ "$148k - $191k",
    between(TARGET_FMV, 191421, 246830) ~ "$191k - $246k",
    between(TARGET_FMV, 246831, 305600) ~ "$246k - $305k",
    TRUE ~ "Higher"
  )) %>%
  group_by(`Fair Cash Value`, TARGET_FMV) %>%
  summarise(median_of_comp = median(COMP_FMV)) %>%
  mutate(`Distance from Median` = (TARGET_FMV - median_of_comp)/median_of_comp*100)

g_data_2 %>%  ggplot(aes(x=`Fair Cash Value`, y=`Distance from Median`)) +
  geom_boxplot(outlier.shape = NA, fill=ccao_colors$lightgreen, color=ccao_colors$darkbrown) +
  coord_cartesian(ylim = c(-10,15))

g_data_5 <- data %>%
  dplyr::filter(!is.na(COMP_PIN)) %>%
  dplyr::group_by(TARGET_PIN) %>%
  dplyr::summarise(comp_n = n(), comp_sale = median(COMP_SALE_VAL), target_fmv = mean(TARGET_FMV)) %>%
  dplyr::mutate(per_from_median = plyr::round_any((target_fmv-comp_sale)/comp_sale, .01)) %>%
  dplyr::group_by(per_from_median) %>%
  dplyr::summarise(
    `Mean Number of Comps` = mean(comp_n)
    , `Number of PINs` = n()) %>%
  dplyr::filter(per_from_median <= .20, per_from_median > 0) %>%
  dplyr::rename('Ratio of median' = 'per_from_median') %>%
  dplyr::mutate(`Ratio of median` = 1 + `Ratio of median`
                , `Share of PINs` = `Number of PINs` / sum(`Number of PINs`)
                , `Cumulative share of PINs` = cumsum( `Number of PINs`)/ sum(`Number of PINs`))

g_data_5 %>% ggplot(aes(x=`Ratio of median`, y=`Cumulative share of PINs`)) +
  geom_line(color = ccao::ccao_colors$navy) + geom_point(color = ccao::ccao_colors$navy) +
  scale_y_continuous(labels = scales::percent_format()) +
  scale_x_continuous(labels = scales::percent_format()) +
  theme_minimal() +
  geom_vline(xintercept = 1.15, linetype = 'dashed') + geom_hline(yintercept = 0.70481928, linetype = 'dashed') +
  labs(title = "Cumulative count of PINs by ratio of comparables sales median")

save(data, file=paste0(out.folder, '/res_appeals_graph_data_5.Rda'))
