data<- read.csv("./Coursera/project1/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

dat <- subset(data, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
rm(data)

png("plot1.png", width=480, height=480)
hist(dat$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()