setwd("C:\\Users\\dgraziotin\\Documents\\GitHub\\ExData_Plotting1")

if(!file.exists("data")){
  dir.create("data")
}

zip_file <- "data/household_power_consumption.zip"


if(!file.exists(zip_file)){
  zip_file_src <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  
  download.file(url=zip_file_src,destfile=zip_file) 
}

df <- read.csv2( unz(zip_file, filename="household_power_consumption.txt"), header = TRUE, na.strings = c("?"), dec="."  )

df <- subset(df, df$Date=="1/2/2007" | df$Date=="2/2/2007")

png(filename="plot1.png",width = 480, height = 480)
with(df,hist(Global_active_power,  col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()
_________________________________________________________________________________________________________________________________
setwd("C:\\Users\\dgraziotin\\Documents\\GitHub\\ExData_Plotting1")

if(!file.exists("data")){
  dir.create("data")
}

zip_file <- "data/household_power_consumption.zip"

if(!file.exists(zip_file)){
  zip_file_src <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  
  download.file(url=zip_file_src,destfile=zip_file) 
}

df <- read.csv2( unz(zip_file, filename="household_power_consumption.txt"), header = TRUE, na.strings = c("?"), dec="."  )

df <- subset(df, df$Date=="1/2/2007" | df$Date=="2/2/2007")

df$Date <- as.character(df$Date)
df$Time <- as.character(df$Time)

df$Timestamp <- strptime(paste(df$Date,df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "usa") # needed on a Windows machine not set to use English date names
png(filename="plot2.png",width = 480, height = 480)
with(df,plot(Timestamp, Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
________________________________________________________________________________________________________________________________
setwd("C:\\Users\\dgraziotin\\Documents\\GitHub\\ExData_Plotting1")

if(!file.exists("data")){
  dir.create("data")
}

zip_file <- "data/household_power_consumption.zip"

if(!file.exists(zip_file)){
  zip_file_src <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  
  download.file(url=zip_file_src,destfile=zip_file) 
}

df <- read.csv2( unz(zip_file, filename="household_power_consumption.txt"), header = TRUE, na.strings = c("?"), dec="."  )

df <- subset(df, df$Date=="1/2/2007" | df$Date=="2/2/2007")

df$Date <- as.character(df$Date)
df$Time <- as.character(df$Time)

df$Timestamp <- strptime(paste(df$Date,df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")


Sys.setlocale("LC_TIME", "usa") # needed on a Windows machine not set to use English date names

png(filename="plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))
par(mcol=c(2,2))

with(df, {
  
  #1st graph
  plot(Timestamp, Global_active_power, type="l",xlab="", ylab="Global Active Power")

  #2nd graph
  plot(Timestamp, Voltage, type="l", ylim=c(234, 246), xlab="datetime", ylab="Voltage")

  # 3rd graph
  plot(Timestamp, Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
  lines(x=Timestamp, y=Sub_metering_2, col="red")
  lines(x=Timestamp, y=Sub_metering_3, col="blue")
  legend(x="topright", 
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         lty=c(1,1), 
         lwd=c(2.5,2.5), 
         col=c("black","red","blue"), 
         bty="n"
  )

  #4th graph
  plot(Timestamp, Global_reactive_power, type="l",xlab="datetime")
  
})

dev.off()
________________________________________________________________________________________________________________________________
library(sqldf)

file<-"./household_power_consumption.txt"
s<-"SELECT * from file WHERE Date= '1/2/2007' OR Date = '2/2/2007'"

f<-read.csv2.sql(file, s)
f2<-f
str(f2)

f2$DateTime<-paste(f2$Date,f2$Time)
f2$DateTimeFormat<-strptime(f2$DateTime,format="%d/%m/%Y %H:%M:%S")
f2$DateFormat <-as.Date(f2$Date,format="%d/%m/%Y")
f2$TimeFormat<-strptime(f2$Time,format="%H:%M:%S")

#Many thanks to the excellent resource at https://www.harding.edu/fmccown/r/
par(mfrow=c(2,2))
plot(y=f2$Global_active_power, x=f2$DateTimeFormat, type="l", xlab=NA, ,ylab="Global Active Power (kilowatts)", ylim=c(0,8), yaxt='n') 
axis(side=2, at=c(0,2,4,6))
plot(y=f2$Voltage, x=f2$DateTimeFormat, type="l",xlab="datetime",ylab="Voltage", ylim=c(232,248), yaxt='n')
axis(side=2, at=c(234,238,242,246))
axis(side=2, at=c(236,240,244),labels=NA)
plot(y=f2$Sub_metering_1, x=f2$DateTimeFormat, type="l", col=pc[1], ylim=c(0,40), yaxt="n",xlab=" ", ylab="Energy sub metering")
axis(side=2, las=1, at=c(0,10,20,30))
lines(y=f2$Sub_metering_2, x=f2$DateTimeFormat, type="l", col=pc[2])
lines(y=f2$Sub_metering_3, x=f2$DateTimeFormat, type="l", col=pc[3])
legend("topright", n, col=pc,lty=1, lwd=2,bty="n")
plot(y=f2$Global_reactive_power,x=f2$DateTimeFormat,type="l",xlab="datetime",ylab="Global_reactive_power",ylim=c(0,0.5))
dev.copy(png,file="plot4.png",width=480, height=480)
dev.off()
________________________________________________________________________________________________________________________________
## Read data from exdata-data-household_power_consumption

MyData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses="character")

## Read and subset data from the dates 2007-02-01 and 2007-02-02

MyData <- MyData[MyData$Date == "2/2/2007" | MyData$Date == "1/2/2007",]
 
## put date & time together and creat ad day/time format 

MyData$Time <- strptime(paste(MyData$Date, MyData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Name the file and construct the plots and save it to a PNG file 
## with a width of 480 pixels and a height of 480 pixels

png(filename="plot4.png", width=480, height=480)

## Set up 2 panel x 2 panel plot area
par(mfcol = c(2,2))

## Construct the first plot
plot(MyData$Time,data$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

## Construct the second plot
plot(MyData$Time, MyData$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")

   ## Add in lines
  	lines(MyData$Time, MyData$Sub_metering_2, type="l", col="red")
	lines(MyData$Time, MyData$Sub_metering_3, type="l", col="blue")

   ## Add a legend
	legend("topright", lty=1, cex=.85, bty="n", col = c("black", "red", "blue"), 
	legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

## Construct the third plot
plot(MyData$Time,MyData$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Construct the fourth plot
plot(MyData$Time,MyData$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

## Close plotting device
dev.off()
