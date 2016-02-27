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

# defining start and end dates
usefulData<-myData[(myData$Date>= startDate)&(myData$Date<= endDate),]


#creating an new attribute by merging date and time
usefulData$Date<-as.character(usefulData$Date)
usefulData$timeAndDate<-paste(usefulData$Date,usefulData$Time,sep=":")
usefulData$timeAndDateFormat<-strptime(usefulData$timeAndDate,format="%Y-%m-%d:%T")

#preparing data for x axis
x<-usefulData$timeAndDateFormat

png(file="plot4.png",height = 480,width = 480)

plot.new()
frame()
plot.new()

# deviding sreen to 4 plots
par(mfrow=c(2,2))


#Energy Global Active Power
# le parametre mfg n'est pas utile dans notre cas
# cependant je l'utilise pour apprendre a choisir les coordonnees d'un plot
par(mfg=c(1,1))
y1_11<-usefulData$Global_active_power
plot(x,y1_11,xlab="",ylab="",type="l" ,ylim=range(y1_11) , col="black" ,yaxt="n")
axis(side = 2,lwd = 2)
mtext("Global Active Power",side=2, line=3)

#Voltage
par(mfg=c(1,2))
y1_12<-usefulData$Voltage
plot(x,y1_12,xlab="",ylab="",type="l" ,ylim=range(y1_12) , col="black",yaxt="n")
mtext("Voltage",side=2, line=4)
mtext("datetime",side=1, line=4)
axis(side = 2,lwd = 2)

#pot 3
par(mfg=c(2,1))
y1_21<-usefulData$Sub_metering_1
y3_21<-usefulData$Sub_metering_3
y2_21<-usefulData$Sub_metering_2

plot(x,y1_21,xlab="",ylab="",type="l" ,ylim=range(y1_21) , col="black",yaxt="n")
par(new=TRUE)
plot(x,y2_21,xlab="",ylab="",type="l" ,ylim=range(y1_21) , yaxt="n",col="red")
par(new=TRUE)
plot(x,y3_21,xlab="",ylab="",type="l" ,ylim=range(y1_21) , col="blue",yaxt="n")
axis(side = 2,lwd = 2)
mtext("Energy sub metering",side=2, line=3)
legend("topright", lty = c("solid","solid","solid"),pch=c(NA,NA,NA),bty = "n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



#Voltage
par(mfg=c(2,2))
y1_22<-usefulData$Global_reactive_power
plot(x,y1_22,xlab="",ylab="",type="l" ,ylim=range(y1_22) , col="black",yaxt="n")
mtext("Global_reactive_power",side=2, line=4)
mtext("datetime",side=1, line=4)
axis(side = 2,lwd = 2)

dev.off()


