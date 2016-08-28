##Read the two files.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Open up the ggplot2 and data.table libraries
library(ggplot2)
library(data.table)

##Generate a Data Table for the Summary and the Source Classification Code and obtain the code for motor vehicles.
NEIDataTable <- data.table(NEI)
SCCDataTable <- data.table(SCC)
SCCMotor <- SCCDataTable[grep("[Mm]obile|[Vv]ehicles", EI.Sector), SCC]

##Aggregate the Motor Emissions and use the Baltimore data again
BALTMotor <- NEIDataTable[SCC %in% SCCMotor, sum(Emissions), by = c("year", "fips")][fips == "24510"]
colnames(BALTMotor) <- c("year", "fips", "Emissions")

##Plot the motor emissions for Baltimore
g = ggplot(BALTMotor, aes(year, Emissions))
g + geom_point(color = "black") + geom_line(color = "blue") + labs(x = "Year") + 
+ labs(y = expression("Total Emissions, PM"[2.5])) + labs(title = "Motor Vehicle Emissions in Baltimore")
