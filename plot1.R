 ## Download data from working directory
alldata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Find subset of alldata to match the dates requested
subdata <- subset(alldata, as.Date(alldata$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))

## Draw histogram
hist(as.numeric(subdata$Global_active_power), main = "Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file= "plot1.png",width = 480, height = 480)
dev.off()


