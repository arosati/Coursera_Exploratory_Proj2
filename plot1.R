NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

#1 Have total emissions from PM2.5 decreased 
#in the United States from 1999 to 2008? Using the 
#base plotting system, make a plot showing the 
#total PM2.5 emission from all sources for each of 
#the years 1999, 2002, 2005, and 2008.

head(NEI)
names(NEI)
 # add Emissions for subset 1999 and subset 2008
emData<-subset(NEI, year==1999|year==2002|year==2005|year==2008, c(Emissions, year))
em<- aggregate(Emissions ~ year, data = emData, sum)
barplot(em$Emissions, names.arg = em$year, main = "Emission Totals Over Time", xlab = "Year", ylab = "Total Emissions")
dev.off()