##Read the two files.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Open up the ggplot2 and data.table libraries
library(ggplot2)
library(data.table)

##Aggregate Emissions for SCC for the respective years
MotorEmissions = NEIDataTable[SCC %in% SCCMotor, sum(Emissions), by = c("year", "fips")]
colnames(MotorEmissions) <- c("year", "fips", "Emissions")

##Plot the Baltimore vs LA emission comparison
g = ggplot(MotorEmissions[fips == "24510" | fips == "06037"], aes(year, Emissions))
g + geom_point() + geom_line(aes(color = fips)) + scale_color_discrete(name = "County", 
+ breaks = c("06037", "24510"), labels = c("Los Angeles", "Baltimore")) + 
+ labs(x = "Year") + labs(y = expression("Total Emissions, PM"[2.5])) + labs(title = "Baltimore vs Los Angeles Motor Vehicle Emissions")
