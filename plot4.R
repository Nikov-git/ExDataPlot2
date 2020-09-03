library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC)
coalcases <- grep("coal", NEISCC$Short.Name, ignore.case = T)
subsetNEISCC <- NEISCC[coalcases, ]
TotalUSACoal <- aggregate(Emissions ~ year, subsetNEISCC, sum)
png("plot4.png")
USAgraph <- ggplot(TotalUSACoal, aes(factor(year), Emissions))
USAgraph <- USAgraph + geom_bar(stat = "identity", fill = "red") +
      xlab("Year") + ylab(expression("Emissions PM"[2.5]*" (in tons)"))+
      ggtitle("Total emissions from coal sources in USA (1999-2008)")
dev.off()