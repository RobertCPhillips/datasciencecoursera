#fips: A five-digit number (represented as a string) indicating the U.S. county
#SCC: The name of the source as indicated by a digit string (see source code classification table)
#Pollutant: A string indicating the pollutant
#Emissions: Amount of PM2.5 emitted, in tons
#type: The type of source (point, non-point, on-road, or non-road)
#year: The year of emissions recorded

#Contains number of tons of PM2.5 emitted from a specific type of source for the entire year.
NEI <- readRDS("summarySCC_PM25.rds")

#Provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
years <- c(1999, 2002, 2005, 2008)
yearCounts <- sapply(years, function(y) sum(NEI[NEI$year == y,"Emissions"]))
fit <- lm(yearCounts~years)

png(filename="plot1.png", width=480, height=480)

plot(years, yearCounts, main="Total Emissions of PM2.5", xlab="Years",
     ylab="Emissions in Tons", type="p", xaxt="n")
points(years, y=yearCounts, pch=19, col = "dark red")
abline(reg=fit) 
axis(1, at=years)

dev.off()



