library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
BaltimoreData <- NEI[NEI$fips == 24510, ]
png("plot3.png")
BaltimoreByType <- ggplot(data = BaltimoreData, aes(factor(year), Emissions, fill = type)) +
      geom_col() +
      facet_grid(facets = .~type) +
      labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
      labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
dev.off()