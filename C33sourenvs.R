## Script for Environmentals Analysis - C33 SOURs

library(dplyr)
library(tidyr)
library(psych)
library(ggplot2)
library(readxl)

setwd("~/R/github/C33report/data")
df <- read_xlsx("C33environmentals.xlsx", sheet = "environmentals")
colnames(df)
df <- pivot_longer(df, 4:11)
df <- filter(df, !is.na(df$value))
colnames(df) <- c("date", "pheno", "zone", "metric", "value")
View(df)
