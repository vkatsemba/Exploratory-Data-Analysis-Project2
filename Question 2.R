##Read the two files.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##For the Baltimore data, we must subset it and then aggregate it.
BALT <- NEI[which(NEI$fips == "24510"), ]
BALTAggr <- with(BALT, aggregate(Emissions, by = list(year), sum))
colnames(BALTAggr) <- c("year", "Emissions")

##Plot the Emissions for Baltimore County
plot(BALTAggr, type = "l", pch = 20, col = "red", xlab = "Year", ylab = "Emissions", main = "Emissions in Baltimore County")
