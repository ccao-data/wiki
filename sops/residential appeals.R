# This file produces summary statistics for the SOPs on residential appeals

# ---- Setup ----
# Load the necessary libraries
library(ggpubr); library(ccao); library(DBI)
library(ggplot2); library(gridExtra); library(htmltools)
library(htmlwidgets); library(jsonlite); library(knitr)
library(leaflet); library(lubridate); library(odbc)
library(readr); library(readxl); library(RSocrata)
library(scales); library(sf); library(stargazer)
library(testit); library(tidyr); library(tidyverse)
library(writexl); library(ccao); library(DT)
library(margins)

setwd(paste0("C:/Users/", Sys.info()[["user"]], "/Documents/wiki_content/sops"))

# ---- Ingest ----
# Directories with data
data1.folder <- paste0("C:/Users/", Sys.info()[["user"]], "/Documents/enterprise-intelligence/ad_hoc")

# Load
load(paste0(data1.folder, '/why_appeal_win.Rda'))


data$`Appeal result` <- str_remove(data$`Appeal result`, " ")
data$Year <- as.factor(data$Year)

#---- Generate predictors ----
data <- data %>% mutate(
  # outcome indicators
  `Reduction indicator` = case_when(
    `Appeal result`== 'C' ~ 1,
    `Appeal result` =='NC' ~ 0,
    `Appeal result` =='X' ~ 0,
    !(`Appeal result` %in% c('C', 'NC', 'X')) ~ NA_real_)
  , `Appeal indicator` = ifelse(`Appeal result` %in% c('C', 'NC'),1,0)
  , `Reduction amount`  = ifelse( `Appeal result`== 'C', `First Pass MV`-`Certififed Pass MV`, 0)
  , `Reduction percent`  = (`First Pass MV`-`Certififed Pass MV`)/`First Pass MV`
  , `Period` = case_when(
    Year != 2019 ~ '2016',
    Year == 2019 ~ '2019')
  , `First Pass Market Value` = case_when(
    `First Pass MV` <=50000 ~ '$0 - $50K',
    `First Pass MV` >50000 & `First Pass MV` <=250000 ~ '$50K - $250K',
    `First Pass MV` >250000 & `First Pass MV` <=350000 ~ '$250K - $350K',
    `First Pass MV` >350000 & `First Pass MV` <=500000 ~ '$350K - $500K',
    `First Pass MV` >500000 & `First Pass MV` <=700000 ~ '$500K - $700K',
    `First Pass MV` >700000 & `First Pass MV` <=1000000 ~ '$700K - $1M',
    `First Pass MV` >1000000 & `First Pass MV` <=1500000 ~ '$1M - $1.5M',
    `First Pass MV` >1500000 ~ '>$1.5M')
)

# ---- Filters ----
data <- data %>% filter((`Reduction percent`>=0 & `Reduction percent` <1) | is.na(`Reduction percent`))
data <- data %>% mutate(`Reduction percent` = case_when(
  `Reduction percent` > .3 ~ .3,
  TRUE ~ `Reduction percent`
))

data$`Reduction amount` <- ifelse(data$`Reduction amount`==0, NA, data$`Reduction amount`)
data$`Reduction percent` <- ifelse(data$`Reduction percent`==0, NA, data$`Reduction percent`)


gd1 <- data %>% group_by(`First Pass Market Value`, Period) %>%
  summarise(
    `Appeal rate` = mean(`Appeal indicator`),
    `Mean reduction %` = mean(`Reduction percent`, na.rm = TRUE),
    `Win rate` = mean(`Reduction indicator`, na.rm=TRUE)
  ) %>%
  pivot_longer(`Appeal rate`:`Win rate`, names_to = 'Statistic', values_to = "Rate")

gd1$`First Pass Market Value` <- factor(gd1$`First Pass Market Value`
                                        , levels = c('$0 - $50K', '$50K - $250K', '$250K - $350K', '$350K - $500K',
                                                     '$500K - $700K', '$700K - $1M', '$1M - $1.5M', '>$1.5M')
)


save(gd1, file = "graph_data_1.Rda")

load(paste0("C:/Users/", Sys.info()[["user"]], "/Documents/appeals-impact-on-tax-rates/data.Rda"))

graph_3 <- data %>%
  dplyr::ungroup() %>%
  dplyr::mutate(
    `Net gain from assessor` = case_when(`Assessor % effect on tax bill` <0 ~ TRUE, TRUE ~ FALSE)
    ,`Net gain from Board` = case_when(`BOR % effect on tax bill` <0 ~ TRUE, TRUE ~ FALSE)
    ,`Net gain from appeals` = case_when(`Appeal % effect on tax bill` <0 ~ TRUE, TRUE ~ FALSE)
    , Year = as.factor(Year)
  ) %>%
  dplyr::filter(`Appeals won` != 'Other' &
                  abs(`Appeal % effect on tax bill`)<.5) %>%
  ggplot(aes(y=`Appeal % effect on tax bill`, x = `Appeals won`, fill=`Major Class`)) +
  geom_boxplot(outlier.shape = NA) +
  scale_y_continuous(labels = function(x) paste0(x*100, "%")) +
  xlab('Successful appeals') +
  ylab('Net appeal effect') +
  theme_minimal() +
  facet_grid(vars(Year)) +
  labs(title = 'Net impact of appeals on tax bills'
       , subtitle = '2017 - 2019') +
  geom_hline(yintercept = 0) +
  scale_fill_manual(values=c(
    ccao::ccao_colors$navy
    , ccao::ccao_colors$gold
    , ccao::ccao_colors$buttermilk
    , ccao::ccao_colors$lightgreen)) +
  theme(legend.position="bottom")

rm(data)

jpeg(file="res_appeals_graph_3.jpeg")
graph_3
dev.off()


