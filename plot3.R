
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


x<-usefulData$timeAndDateFormat

y1<-usefulData$Sub_metering_1
y3<-usefulData$Sub_metering_3
y2<-usefulData$Sub_metering_2

range(y2)

# par(new=TRUE)
# plot(usefulData$timeAndDateFormat,usefulData$Sub_metering_2,type="l",xlab="",ylab="Energy Sub metering",col="red")

#range(timeAndDateFormat)

plot(x,y1,xlab="",ylab="",type="l" ,ylim=range(y1) , col="black",yaxt="n")
par(new=TRUE)
plot(x,y2,xlab="",ylab="",type="l" ,ylim=range(y1) , yaxt="n",col="red")
par(new=TRUE)
plot(x,y3,xlab="",ylab="",type="l" ,ylim=range(y1) , col="blue",yaxt="n")

mtext("Energy Sub metering",side=2, line=2)

dev.copy(png,file="plot3.png")
dev.off()