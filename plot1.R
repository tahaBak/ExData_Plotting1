
Sys.setlocale("LC_TIME","en_US.utf8")


myData<-read.csv("household_power_consumption.txt", sep=";",colClasses = c("character","character","numeric","numeric","numeric",
                                                                           "numeric","numeric","numeric"),na.strings="?")

myData$Date<-as.Date(myData$Date,format="%d/%m/%Y")
head(myData$Date)

startDate<-as.Date("01/02/2007",format="%d/%m/%Y")
startDate
endDate<-as.Date("2/2/2007",format="%d/%m/%Y")
endDate


usefulData<-myData[(myData$Date>= startDate)&(myData$Date<= endDate),]
head(usefulData)
tail(usefulData)

class(usefulData$Global_active_power)

hist(usefulData$Global_active_power,main="Global Active Power", col="red",xlab="Global Active Power (Kilowatts)")

colnames(myData)
head(myData)

dev.copy(png,file="plot1.png")
dev.off()