library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC)
subsetNEISCC <- NEISCC[NEI$fips=="24510" & NEI$type=="ON-ROAD", ]
VehicleBaltimore <- aggregate(Emissions ~ year, subsetNEISCC, sum)

png("plot5.png")
graphBaltimoreV <- ggplot(VehicleBaltimore, aes(factor(year), Emissions, color = "grey"))
graphBaltimoreV <- graphBaltimoreV + geom_col(fill = "red")+
      xlab("year") +
      ylab("Total vehicle emission") +
      ggtitle('Total vehicle emissions in Baltimore  from 1999 to 2008')
print(graphBaltimoreV)
dev.off()