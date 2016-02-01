##Read the two files.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Identify the coal emissions from the Source Classification Code
Coal <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
SCCcoal <- SCC[Coal, ]
Id <- as.character(SCCcoal$SCC)

##Find SCC in the summary code
NEI$SCC <- as.character(NEI$SCC)
NEICoal <- NEI[NEI$SCC %in% Id, ]

##Aggregate the coal numbers
CoalAggr <- with(NEICoal,aggregate(Emissions, by = list(year), sum))
colnames(CoalAggr) <- c("year", "Emissions")

##Plot the Coal Combustions and Emissions
plot(CoalAggr, type = "l", xlab = "Year", ylab = expression("Total Emissions, PM"[2.5]), main = "United States Coal Combustions + Emissions")
