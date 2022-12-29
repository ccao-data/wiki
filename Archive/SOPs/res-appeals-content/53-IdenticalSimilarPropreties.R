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
CHARS.ATTIC_FNSH,
CHARS.ROOMS,
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
A.FBATH AS TARGET_FULLBATH,
A.HBATH AS TARGET_HALFBATH,
A.ROOMS AS TARGET_ROOMS,
A.BSMT_FIN AS TARGET_BSMT_FIN,
A.ATTIC_FNSH AS TARGET_ATTIC_FNSH,
A.BLDG_SF AS TARGET_BLDG_SF,
B.PIN AS COMP_PIN,
B.SALE_VAL AS COMP_SALE_VAL,
B.SALE_DATE AS COMP_SALE_DATE,
B.ASSMNT_VAL * 10 AS COMP_FMV,
B.FBATH AS COMP_FULLBATH,
B.HBATH AS COMP_HALFBATH,
B.ROOMS AS COMP_ROOMS,
B.BSMT_FIN AS COMP_BSMT_FIN,
B.ATTIC_FNSH AS COMP_ATTIC_FNSH,
B.BLDG_SF AS COMP_BLDG_SF
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

save(data, file=paste0(out.folder, '/identicalsimilar.Rda'))

# Disconnect DB connection
dbDisconnect(CCAODATA)

# ------------------------------------------------------------------------------------------  break

load(paste0(out.folder, '/identicalsimilar.Rda'))

similar_iden_data <- data %>% 
  mutate(sqft_diff = TARGET_BLDG_SF/COMP_BLDG_SF) %>% 
  mutate(vir_identical = ifelse(TARGET_FULLBATH == COMP_FULLBATH &
                                  TARGET_HALFBATH == COMP_HALFBATH & 
                                  sqft_diff <= 1.05 & 
                                  sqft_diff >= 0.95 & 
                                  TARGET_BSMT_FIN == COMP_BSMT_FIN & 
                                  TARGET_ATTIC_FNSH == COMP_ATTIC_FNSH, 1, 0)) %>% 
  mutate(similar = ifelse(sqft_diff <= 1.1 & 
                            sqft_diff >= 0.9 & 
                            (TARGET_FULLBATH <= COMP_FULLBATH + 1 & TARGET_FULLBATH >= COMP_FULLBATH - 1), 1, 0))


# Guildline A: A reduction is warranted if the fair cash value of the subject property is 
# greater than or equal to 1.1 times the median of its uniformity distribution.

guid_a <- similar_iden_data %>% 
  filter(COMP_FMV != 0) %>% 
  group_by(TARGET_PIN) %>% 
  summarise(comp_fmv_med=median(COMP_FMV, na.rm = TRUE), tar_fmv=mean(TARGET_FMV)) %>% 
  mutate(ratio=tar_fmv/comp_fmv_med)

quantile(guid_a$ratio, probs = c(0.05, 0.96, 1))
# Result: Only 4% sample satisfy this guideline.

# Guildline B: A reduction is warranted if there are at least three virtually identical 
# properties with fair cash values less than or equal to .95 times the subject property's fair cash value.

guid_b <- similar_iden_data %>% 
  filter(COMP_FMV != 0) %>% 
  mutate(ratio = COMP_FMV/TARGET_FMV) %>% 
  mutate(is_95_per = ifelse(vir_identical == 1 & ratio <= .95, 1, 0)) %>% 
  group_by(TARGET_PIN) %>% 
  summarise(n_satisfy = sum(is_95_per))
quantile(guid_b$n_satisfy, probs = c(0.05, 0.90, 1))
# Result: 10% sample satisfy this guideline.

# Guildline BB: A reduction is warranted if there are at least six similar properties with fair cash 
# values less than or equal to .90 times the subject property's fair cash value.

guid_bb <- similar_iden_data %>% 
  filter(COMP_FMV != 0) %>% 
  mutate(ratio = COMP_FMV/TARGET_FMV) %>% 
  mutate(is_90_per = ifelse(similar == 1 & ratio <= .90, 1, 0)) %>% 
  group_by(TARGET_PIN) %>% 
  summarise(n_satisfy = sum(is_90_per))
quantile(guid_bb$n_satisfy, probs = c(0.05, 0.92, 1))
# Result: 8% sample satisfy this guideline.

# Guildline AA: A reduction is not warranted if there are fewer than three comparable properties, 
# either virtually identical or similar.
guid_aa <- similar_iden_data %>% 
  filter(COMP_FMV != 0) %>%
  mutate(is_com = ifelse(similar + vir_identical == 2, 1, 
                          ifelse(similar + vir_identical == 1, 1, 0))) %>% 
  group_by(TARGET_PIN) %>% 
  summarise(total_comps = sum(is_com))
quantile(guid_aa$total_comps, probs = c(0.05, 0.25, 1))
# Result: 25% sample has fewer than 3 comparables.