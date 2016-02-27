
#using english for times 
Sys.setlocale("LC_TIME","en_US.utf8")

#reading data from household_power_consumption.txt & converting date to the corrrect format
myData<-read.csv("household_power_consumption.txt", sep=";",colClasses = c("character","character","numeric","numeric","numeric",
                                                                           "numeric","numeric","numeric"),na.strings="?")

myData$Date<-as.Date(myData$Date,format="%d/%m/%Y")


# defining start and end dates

startDate<-as.Date("01/02/2007",format="%d/%m/%Y")
startDate
endDate<-as.Date("2/2/2007",format="%d/%m/%Y")
endDate

#filtering data
usefulData<-myData[(myData$Date>= startDate)&(myData$Date<= endDate),]

#creating an new attribute by merging date and time
usefulData$Date<-as.character(usefulData$Date)
usefulData$timeAndDate<-paste(usefulData$Date,usefulData$Time,sep=":")
usefulData$timeAndDateFormat<-strptime(usefulData$timeAndDate,format="%Y-%m-%d:%T")

#plotting
plot(usefulData$timeAndDateFormat,usefulData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#recording the graph in the plot2.png using correct dimensions
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()
