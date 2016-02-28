NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

#3 Of the four types of sources indicated by the 
# type (point, nonpoint, onroad, nonroad) variable, which of these 
# four sources have seen decreases in emissions from 1999–2008 
# for Baltimore City? Which have seen increases in emissions 
# from 1999–2008? Use the ggplot2 plotting system to make a plot 
# answer this question.

library(ggplot2)
head(NEI)
names(NEI)
emBalt<-subset(NEI, fips=="24510", c(Emissions, type, year))
str(emBalt)
em<- aggregate(Emissions~type+year, data=emBalt, sum)
em$year<-as.factor(em$year)
g <- ggplot(em, aes(year,Emissions))
g <- g + geom_bar(stat="identity", fill="brown",alpha=0.8)
g <- g + facet_wrap( ~type, nrow=1, ncol=4 )
g <- g + theme(axis.text.x = element_text(angle=45))
g <- g + labs(title="Total Emissions Over Time by Type in Baltimore")
g
dev.off()
