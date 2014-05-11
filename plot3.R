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

## Draw plot with multiple lines and clors
plot(cleanData$Date_Time,cleanData$Sub1, type="l", xlab="", ylab="Energy sub metering")
lines(cleanData$Date_Time,cleanData$Sub2,type="l",col="red")
lines(cleanData$Date_Time,cleanData$Sub3,type="l",col="blue")

## Add legend in right corner
legend("topright",c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),lty=1,col=c("black","red","blue"))

## Save to png file
dev.copy(png, file= "plot3.png",width = 480, height = 480)
dev.off()