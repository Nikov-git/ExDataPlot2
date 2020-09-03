library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC)
subsetNEISCC <- NEISCC[(NEISCC$fips == "24510" | NEISCC$fips == "06037") & NEISCC$type == "ON-ROAD", ]
CompBaltimoreAngeles <- aggregate(Emissions ~ year + fips, subsetNEISCC, sum)
CompBaltimoreAngeles$fips[CompBaltimoreAngeles$fips == "24510"] <- "Baltimore City, Maryland"
CompBaltimoreAngeles$fips[CompBaltimoreAngeles$fips == "06037"] <- "Los Angeles, CA"
png("plot6.png")
CompPlot <- ggplot(CompBaltimoreAngeles, aes(factor(year), Emissions, fill = fips))
CompPlot <- CompPlot + geom_bar(stat= "identity") + 
      facet_grid(facets = .~fips) +
      labs(x= "Years", y= expression("Total PM"[2.5]*" Emissions")) +
      ggtitle(expression("Total PM"[2.5]*" Emissions in Baltimore and Los Angeles from 1999 to 2008"))
dev.off()
              