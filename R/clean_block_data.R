library(here)
library(tidyverse)


# 1990 --------------------------------------------------------------------

blocks_1990 <- read_csv(here("data-raw", "nhgis_ds120_1990_block.csv")) %>%
  mutate(white = ET2001,
         black = ET2002,
         aian = ET2003,
         aapi = ET2004,
         other = ET2005,
         hispanic = ET2006 + ET2007 + ET2008 + ET2009 + ET2010) %>%
  select(state_code = STATEA, county = COUNTYA, tract = TRACTA, block = BLOCKA,
         aapi, aian, black, hispanic, other, white)

for (state in unique(blocks_1990$state_code)) {
  blocks_1990 %>%
    filter(state_code == state) %>%
    write_csv(here("data", "1990", paste0("blocks_1990_", state, ".csv")))
}


# 2000 --------------------------------------------------------------------

blocks_2000 <- read_csv(here("data-raw", "nhgis_ds147_2000_block.csv")) %>%
  mutate(white = FYF001,
         black = FYF002,
         aian = FYF003,
         aapi = FYF004 + FYF005,
         other = FYF006,
         multi = FYF007 + FYF014,
         hispanic = FYF008 + FYF009 + FYF010 + FYF011 + FYF012 + FYF013,
         block = as.character(BLOCKA)) %>%
  select(state_code = STATEA, county = COUNTYA, tract = TRACTA, block,
         aapi, aian, black, hispanic, multi, other, white)

for (state in unique(blocks_2000$state_code)) {
  blocks_2000 %>%
    filter(state_code == state) %>%
    write_csv(here("data", "2000", paste0("blocks_2000_", state, ".csv")))
}


# 2010 --------------------------------------------------------------------

blocks_2010 <- read_csv(here("data-raw", "nhgis_ds172_2010_block.csv")) %>%
  mutate(white = H7Z003,
         black = H7Z004,
         aian = H7Z005,
         aapi = H7Z006 + H7Z007,
         other = H7Z008,
         multi = H7Z009 + H7Z017,
         hispanic = H7Z010 - H7Z017,
         block = as.character(BLOCKA)) %>%
  select(state_code = STATEA, county = COUNTYA, tract = TRACTA, block,
         aapi, aian, black, hispanic, multi, other, white)

for (state in unique(blocks_2010$state_code)) {
  blocks_2010 %>%
    filter(state_code == state) %>%
    write_csv(here("data", "2010", paste0("blocks_2010_", state, ".csv")))
}
