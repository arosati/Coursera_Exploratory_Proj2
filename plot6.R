NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037"). Which city has seen greater changes 
# over time in motor vehicle emissions?


laBalt <- subset(NEI, fips=="24510"|fips=="06037", c(Emissions, type, year, fips))
head(laBalt)
codes<- subset(SCC, subset = grepl("[vV]ehicle", Short.Name))
motor<- merge(x=laBalt, y=codes)
em<- aggregate(Emissions~fips+year, data=motor, sum)
em$year<-as.factor(em$year)

g <- ggplot(em, aes(year,Emissions, color=fips, group=fips))
g <- g + geom_bar(stat="identity", fill="brown",alpha=0.8)
g <- g + facet_wrap( ~fips, nrow=1, ncol=4 )
g <- g + theme(axis.text.x = element_text(angle=45))
g <- g + labs(title="Motor Vehicle Emissions in Los Angeles vs Baltimore")
g
dev.off()
