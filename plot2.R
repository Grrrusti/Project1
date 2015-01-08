data<- read.csv("./Coursera/project1/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

dat <- subset(data, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
rm(data)

dTime<- paste(as.Date(dat$Date), dat$Time)
dat$dTime<- as.POSIXct(dTime)

png("plot2.png", width=480, height=480)
plot(dat$dTime, dat$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()