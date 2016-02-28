NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

#2 Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
#system to make a plot answering this question.


head(NEI)
names(NEI)
 # add Emissions for subset 1999 and subset 2008 for fips 24510
emData<-subset(NEI, year==1999|year==2008, c(fips, Emissions, year))
emBalt<-subset(emData, fips=="24510")
em<- aggregate(Emissions ~ year, data = emBalt, sum)
barplot(em$Emissions, names.arg = em$year, main = "Baltimore Emission Totals Over Time", xlab = "Year", ylab = "Total Emissions")
dev.off()