 ## Reading the data
 newdata<- "./test/household_power_consumption.txt"
 powerdata <- read.table(newdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
 powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
 
 ## Subsetting the specific dates
 finaldata<- subset(powerdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
 
 ## Converting dates and changing the class to numeric
 datetime <- paste(as.Date(finaldata$Date), finaldata$Time)
 finaldata$Datetime <- as.POSIXct(datetime)
 GlobeActivePower<- as.numeric(finaldata$Global_active_power)
 
 ## Plotting plot1
hist(GlobeActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
   
 ## Saving to file
 dev.copy(png, file="plot1.png", height=480, width=480)
 dev.off()
