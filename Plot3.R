## Reading the data
newdata<- "./test/household_power_consumption.txt"
powerdata <- read.table(newdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

## Subsetting the specific dates
finaldata<- subset(powerdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates and changing the class to numeric
datetime <- paste(as.Date(finaldata$Date), finaldata$Time)
finaldata$Datetime <- as.POSIXct(datetime)
finaldata$GlobeActivePower<- as.numeric(finaldata$Global_active_power)

## Plotting plot3
with(finaldata, {
plot(Sub_metering_1~Datetime, type="l",
ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

