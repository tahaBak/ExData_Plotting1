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

#preparing data to plot
x<-usefulData$timeAndDateFormat

y1<-usefulData$Sub_metering_1
y3<-usefulData$Sub_metering_3
y2<-usefulData$Sub_metering_2

png(file="plot3.png",height = 480,width = 480)
#plotting data
plot(x,y1,xlab="",ylab="",type="l" ,ylim=range(y1) , col="black",yaxt="n")
par(new=TRUE)
plot(x,y2,xlab="",ylab="",type="l" ,ylim=range(y1) , yaxt="n",col="red")
par(new=TRUE)
plot(x,y3,xlab="",ylab="",type="l" ,ylim=range(y1) , col="blue",yaxt="n")
mtext("Energy Sub metering",side=2, line=2)
legend("topright", lty = c("solid","solid","solid"),pch=c(NA,NA,NA),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#recording the graph in the plot3.png using correct dimensions

dev.off()