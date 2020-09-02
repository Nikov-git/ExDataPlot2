NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
as.data.frame(NEI)
TEBaltimore <- NEI[NEI$fips == "24510", ]
TotalEmissions <- aggregate(Emissions ~ year, TEBaltimore, sum)
png("plot2.png")
barplot(TotalEmissions$Emissions,
        main = expression("Total PM"[2.5]*" emissions by year  in Baltimore(from 1999 to 2008)"),
        cex.main = 1.05,
        xlab = "Year", ylab = expression("PM"[2.5]*" Emissions"), cex.lab= 1,
        names.arg = TotalEmissions$year, 
        col = rainbow(25), 
        border = "grey")
dev.off()
