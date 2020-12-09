## Script for Environmentals Analysis - C33 SOURs

library(dplyr)
library(tidyr)
library(psych)
library(ggplot2)
library(readxl)
library(tibble)

setwd("~/R/github/C33report/data")
df <- read_xlsx("C33environmentals.xlsx", sheet = "environmentals")
colnames(df)
df <- pivot_longer(df, 4:11)
df <- filter(df, !is.na(df$value))
colnames(df) <- c("date", "pheno", "zone", "metric", "value")

View(df)
summary(df)

dfpheno <- filter(df, !is.na(df$pheno))
dfphenoAL <- filter(dfpheno, dfpheno$zone == "AL")
dfphenoCU <- filter(dfpheno, dfpheno$zone == "CU")
df <- filter(df, is.na(pheno))
dfAL <- filter(df, df$zone == "AL")
dfCU <- filter(df, df$zone == "CU")

times <- unique(df$date)

sourmoisture <- ggplot() + 
  geom_line(data = filter(dfphenoAL, dfphenoAL$metric == "Moisture Content" & dfphenoAL$pheno == "SOUR011"), 
            aes(x = date, y = value), color = "blue") +
  geom_line(data = filter(dfphenoCU, dfphenoCU$metric == "Moisture Content"& dfphenoCU$pheno == "SOUR011"),
            aes(x = date, y = value), color = "red") +
  xlab('dates') +
  ylab('Moisture Content (%)')
sourmoisture
