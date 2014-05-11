 ## Download data from working directory
subdata<-read.table("household_power_consumption.txt", sep = ";",  skip = 66637, nrows = 2880)
names(subdata)<-c("Date","Time","Global","Reactive","Intensity","Volts","Sub1","Sub2","Sub3")

## Draw histogram
hist(as.numeric(subdata$Global), main = "Global Active Power",xlab="Global Active Power (kilowatts)", col="red")

## Copy to png file
dev.copy(png, file= "plot1.png",width = 480, height = 480)
dev.off()



