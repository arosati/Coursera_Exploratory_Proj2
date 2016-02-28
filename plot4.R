NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Across the United States, how have emissions from 
# coal combustion-related sources changed from 1999–2008?

codes<- subset(SCC, subset = grepl("[cC]oal", Short.Name))
coal<- merge(x=NEI, y=codes)
names(coal)
summary(coal)
coalem<-aggregate(Emissions ~ year, data=coal, sum)
barplot(coalem$Emissions, names.arg = coalem$year, main = "Coal-Related Emissions Over Time", xlab = "Year", ylab = "Total Emissions")
dev.off()
