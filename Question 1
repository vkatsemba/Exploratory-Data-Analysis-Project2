##Read the two files.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Aggregate the emissions total
aggemissions <- with(NEI, aggregate(Emissions, by = list(year), sum))

##Plot the amount of emissions per year
plot(aggemissions, type = "l", pch = 20, col = "blue", xlab = "Year", ylab = "Emissions", main = "Emissions per Year")
