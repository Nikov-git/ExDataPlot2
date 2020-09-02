unzip("data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIR <- as.data.frame(NEI)
TotalEmissions <- aggregate(Emissions ~ year, NEIR, sum)
png("plot1.png")
barplot(TotalEmissions$Emissions,
        main = expression("Total PM"[2.5]*" emissions by year (from 1999 to 2008)"),
        cex.main = 1.25,
        xlab = "Year", ylab = expression("PM"[2.5]*" Emissions"), cex.lab= 1,
        ylim = c(0, 7500000), 
        names.arg = TotalEmissions$year, 
        col = rainbow(5), 
        border = "grey", 
        )
dev.off()


