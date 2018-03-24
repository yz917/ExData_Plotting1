## read the data around the dates 2007-02-01 and 2007-02-02
data_all<-read.table("household_power_consumption.txt",skip=66000,nrows=4000,sep=';',
		col.names=c("Date","Time","Global_active_power","Global_reactive_power",
		"Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## subset the data from the dates 2007-02-01 and 2007-02-02
data<-subset(data_all,Date=="1/2/2007"|Date=="2/2/2007")
## change your locale to English
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")
## plot
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12)
time <- strptime(unite(data,"Time", Date:Time,sep=" ")$Time,
				format="%d/%m/%Y %H:%M:%S")
plot(time, data$Global_active_power, type="n",
	xlab="", ylab="Global Active Power (kilowatts)")
lines(time, data$Global_active_power,type="l") 
dev.off()