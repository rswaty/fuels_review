

# Library
library(scales)
library(tidyverse)
library(viridis)

options(scipen=10000)

# read data
mz01 <- read_csv("data/MZ01_CAFBPandLFFBP_wHazard.csv")


# Heatmap 
ggplot(mz01, aes(CA_FuelType, LF_FuelType, fill= Count)) + 
  geom_tile(color = "grey") +
  scale_fill_viridis(discrete=FALSE, labels = scales::comma) 
