data<- read.csv("./Coursera/project1/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

dat <- subset(data, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
rm(data)

dTime<- paste(as.Date(dat$Date), dat$Time)
dat$dTime<- as.POSIXct(dTime)

subMetering1 <- as.numeric(dat$Sub_metering_1)
subMetering2 <- as.numeric(dat$Sub_metering_2)
subMetering3 <- as.numeric(dat$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(dat$dTime, dat$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(dat$dTime, dat$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(dat$dTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dat$dTime, subMetering2, type="l", col="red")
lines(dat$dTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering1", "Sub_metering2", "Sub_metering3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(dat$dTime, dat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()