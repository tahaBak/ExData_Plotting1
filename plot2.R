

Sys.setlocale("LC_TIME","en_US.utf8")

myData<-read.csv("household_power_consumption.txt", sep=";",colClasses = c("character","character","numeric","numeric","numeric",
                                                                           "numeric","numeric","numeric"),na.strings="?")

myData$Date<-as.Date(myData$Date,format="%d/%m/%Y")

startDate<-as.Date("01/02/2007",format="%d/%m/%Y")
startDate
endDate<-as.Date("2/2/2007",format="%d/%m/%Y")
endDate


usefulData<-myData[(myData$Date>= startDate)&(myData$Date<= endDate),]
head(usefulData)
tail(usefulData)

usefulData$Date<-as.character(usefulData$Date)

usefulData$timeAndDate<-paste(usefulData$Date,usefulData$Time,sep=":")
head(usefulData$timeAndDate)

usefulData$timeAndDateFormat<-strptime(usefulData$timeAndDate,format="%Y-%m-%d:%T")
head(usefulData$timeAndDateFormat)

length(usefulData$timeAndDateFormat)
length(usefulData$Global_active_power)
plot(usefulData$timeAndDateFormat,usefulData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")


dev.copy(png,file="plot2.png")
dev.off()
