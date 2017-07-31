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

png(filename="C:/Users/minsa/Desktop/Coursera_Data_Analyst/plot1.png")

hist(as.numeric(as.character(HPC_Dates$Global_active_power)), 
	main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")

dev.off()
