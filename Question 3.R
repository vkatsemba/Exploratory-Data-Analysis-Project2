##Read the two files.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Load the ggplot2 and plyr libraries
library(ggplot2)
library(plyr)

##Once again, we must subset the data that we used for Question 2 and then aggregate it.
BALT <- NEI[which(NEI$fips == "24510"), ]
BALTAggr <- with(BALT, aggregate(Emissions, by = list(year), sum))
colnames(BALTAggr) <- c("year", "Emissions")

##We aggregate the data by type
emissionstype <- ddply(BALT, .(type, year), summarize, Emissions = sum(Emissions))
emissionstype$Pollutant_Type <- emissionstype$type

##Plot the Four different types of pollutants
qplot(year, Emissions, data = emissionstype, group = Pollutant_Type, color = Pollutant_Type, geom = c("point", "line"), xlab = "Year", ylab = expression("Total Emissions, PM"[2.5]))
