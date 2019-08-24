setwd('C:/Users/hiroo.ishikawa/Documents/coursera')
setwd('C:/Users/ishi/Documents/RWK/coursera')

library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Q1
library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")

NEI_Yearly_Emiss_df <- NEI %>% group_by(year) %>% summarize(Total_Emissions=sum(Emissions))
NEI_Yearly_Emiss <- NEI_Yearly_Emiss_df$Total_Emissions
names(NEI_Yearly_Emiss) <- NEI_Yearly_Emiss_df$year

options(scipen=7)
png("plot1.png", width = 480, height = 480)
par(mar=c(5,7,2,2), mgp=c(3.5,0.5,0))
barplot(NEI_Yearly_Emiss,xlab='Year',ylab='Total Emissions',yaxt="n")
axis(2, las=2, cex.axis=0.7)
title('the total PM2.5 emission from all sources')
dev.off()


## Q2
library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")

NEI_Yearly_Emiss_df <- NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarize(Total_Emissions=sum(Emissions))
NEI_Yearly_Emiss <- NEI_Yearly_Emiss_df$Total_Emissions
names(NEI_Yearly_Emiss) <- NEI_Yearly_Emiss_df$year

options(scipen=7)
png("plot2.png", width = 480, height = 480)
par(mar=c(5,7,2,2), mgp=c(2.5,0.5,0))
barplot(NEI_Yearly_Emiss,xlab='Year',ylab='Total Emissions',yaxt="n")
axis(2, las=2, cex.axis=0.7)
title('Baltimore City, Maryland')
dev.off()


## Q3
library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")

NEI_Yearly_Emiss_df <- NEI %>% filter(fips == "24510") %>% group_by(year,type) %>% summarize(Total_Emissions=sum(Emissions))

png("plot3.png", width = 480, height = 480)
ggplot(NEI_Yearly_Emiss_df,aes(x=year,y=Total_Emissions))+geom_line(aes(color=type),size=1)+ggtitle('Baltimore City, Maryland')
dev.off()


## Q4
library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_Coal_v <- SCC %>% filter(str_detect(EI.Sector,'Coal')) %>% pull(SCC)
NEI_Coal_Emiss_df <- NEI %>% filter(SCC %in% SCC_Coal_v) %>% group_by(year) %>% summarize(Coal_Emissions=sum(Emissions)) %>%
    mutate(year=factor(year))

png("plot4.png", width = 480, height = 480)
ggplot(NEI_Coal_Emiss_df,aes(x=year,y=Coal_Emissions))+geom_bar(stat='identity',width=0.7)+
    ggtitle('emissions from coal combustion-related sources')
dev.off()


## Q5
library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_Vehi_v <- SCC %>% filter(str_detect(EI.Sector,'Vehicle')) %>% pull(SCC)
NEI_Bal_Vehi_df <- NEI %>% filter(SCC %in% SCC_Vehi_v & fips=='24510') %>%
    group_by(year) %>% summarize(Bal_Vehi_Emissions=sum(Emissions)) %>% mutate(year=factor(year))

png("plot5.png", width = 480, height = 480)
ggplot(NEI_Bal_Vehi_df,aes(x=year,y=Bal_Vehi_Emissions))+geom_bar(stat='identity',width=0.7)+
    ggtitle('Emissions from motor vehicle sources in Baltimore City')
dev.off()

## Q6
library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_Vehi_v <- SCC %>% filter(str_detect(EI.Sector,'Vehicle')) %>% pull(SCC)
NEI_Vehi_df <- NEI %>% filter(SCC %in% SCC_Vehi_v & str_detect(fips,'24510|06037')) %>%
    group_by(fips,year) %>% summarize(Vehi_Emissions=sum(Emissions)) %>% ungroup() %>% 
    mutate(fips=recode(fips,'24510'='Baltimore','06037'='Los Angeles'), Vehi_Emissions=as.integer(Vehi_Emissions))

png("plot6.png", width = 480, height = 480)
ggplot(NEI_Vehi_df,aes(x=year,y=Vehi_Emissions))+geom_line(aes(color=fips),size=1)+
    ggtitle('Emissions from Vehicles in Baltimore and Los Angeles')
dev.off()
