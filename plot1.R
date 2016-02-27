
# using english for times

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

#drawing histogram
hist(usefulData$Global_active_power,main="Global Active Power", col="red",xlab="Global Active Power (Kilowatts)")

#recording the graph in the plot1.png using correct dimensions
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()