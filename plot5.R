NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# How have emissions from motor vehicle sources 
# changed from 1999–2008 in Baltimore City?

codes<- subset(SCC, subset = grepl("[vV]ehicle", Short.Name))
motor<- merge(x=NEI, y=codes)
motorBalt <- subset(motor, fips=="24510")
motorem<-aggregate(Emissions ~ year, data=motorBalt, sum)
barplot(motorem$Emissions, names.arg = motorem$year, main = "Motor Vehicle-Related Emissions Over Time", xlab = "Year", ylab = "Total Emissions")
dev.off()