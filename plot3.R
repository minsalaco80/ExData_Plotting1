if(!file.exists('data.zip')){
    url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
	download.file(url,destfile = "data.zip")
}

unzip("data.zip")

HPC<- read.table("household_power_consumption.txt",header = TRUE, sep= ";")

HPC$DateTime<- paste(HPC$Date, HPC$Time)

HPC$DateTime<- strptime(HPC$DateTime, "%d/%m/%Y %H:%M:%S")

First<-which(HPC$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

Last<-which(HPC$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

HPC_Dates<- HPC[First:Last,]

png(filename="C:/Users/minsa/Desktop/Coursera_Data_Analyst/plot3.png")

plot(HPC_Dates$DateTime, as.numeric(as.character(HPC_Dates$Sub_metering_1)), type='l', ylab ="Energy sub metering", xlab="")
	legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"))
	lines(HPC_Dates$DateTime, as.numeric(as.character(HPC_Dates$Sub_metering_2)), type='l', col='red')
	lines(HPC_Dates$DateTime, HPC_Dates$Sub_metering_3, type='l', col="blue")

dev.off()