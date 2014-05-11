## Download data from working directory
subdata<-read.table("household_power_consumption.txt", sep = ";",  skip = 66637, nrows = 2880)
names(subdata)<-c("Date","Time","Global","Reactive","Intensity","Volts","Sub1","Sub2","Sub3")

## Combine the date and time fields
dates<-as.Date(subdata$Date, format="%d/%m/%Y")
times<-as.character(subdata$Time)
Date_Time<-as.POSIXlt(paste(dates,times))

## Create a simple data frame with Date_Time field
cleanData<-data.frame(Date_Time,subdata$Global,subdata$Reactive,subdata$Intensity,subdata$Volts,subdata$Sub1,subdata$Sub2,subdata$Sub3)
names(cleanData)<-c("Date_Time","Global","Reactive","Intensity","Volts","Sub1","Sub2","Sub3")

## Draw plot
plot(cleanData$Date_Time,cleanData$Global, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Save to png file
dev.copy(png, file= "plot2.png",width = 480, height = 480)
dev.off()
