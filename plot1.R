tab5rows <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 5)
classes <- sapply(tab5rows, class)
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = classes)
class(mydata)

classes = c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric")
mydata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is)
mydata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
sapply(mydata,class)

## converting strings to dates
ndate3 <- as.Date(sdate3, "%m-%d-%Y")

## converting strings to time
dates<-as.Date(mydata$Date,"%d-%m-%Y")
head(dates)

## reading a txt file
	## colClasses
	mydata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", quote ="", stringsAsFactors = FALSE)
	
## checking classes
sapply(mydata, class)

## striptime ()

##as.Date

## missing values are ?

hpc <- read.table(file = "household_power_consumption.txt", 
                  sep = ";", 
                  skip = 66637,
                  nrows = 2880)
 data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringAsFactors = FALSE)
 subdata <- subset(data, as.Date(data$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))
 sapply(subdata,class)
 hist(as.numeric(subdata$Global_active_power),col="red")
 
## Download data from working directory
alldata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## Find subset of alldata to match the dates requested
 subdata <- subset(alldata, as.Date(alldata$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))
 sapply(subdata,class)
 head(subdata)
 
## Combine the date and time fields
x<-paste(subdata$Date,subdata$Time)
Dates<-strptime(x, "%d/%m/%y %H:%M:%S")
head(Dates)
## What do we do with the Time field
## read in date/time info in format 'm/d/y h:m:s'
dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
times <- c("23:03:20", "22:29:56", "01:03:30", "18:21:03", "16:56:26")
x <- paste(dates, times)


x	
An object to be converted: a character vector for strptime, an object which can be converted to "POSIXlt" for strftime.
## Draw histogram on screen

## How do you make png file?
## Change to png format 480 x 480
## Make png file plot1.png

## How do we get days on the x axis
drawxaxis(x, tick.tstep = "auto", lab.tstep = "auto", 
          lab.fmt=NULL, cex.axis=1, ...)


## How do you make line chart?
## How do you make more than one line on chart?
