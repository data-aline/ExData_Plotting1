
#read data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")

#subset data

subset_data<-data[data$Date %in% c("1/2/2007" ,"2/2/2007") ,]

#add new colummn "moment"
subset_data<-mutate(subset_data,moment=dmy_hms(paste(Date,Time)))


#build plot
subset_data[,"Global_active_power"]<-as.numeric(subset_data[,"Global_active_power"])

png(file= "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

#1st plot
with(subset_data,plot(Global_active_power~moment,type="l",xlab="",ylab="Global Active Power" ))

#2nd plot
with(subset_data,plot(Voltage~moment,type="l",xlab="datetime"))

#3rd plot

with(data2,{plot(Sub_metering_1~moment,type="l",xlab="",ylab="Energy sub metering")
        lines(Sub_metering_2~moment,col="Red")
        lines(Sub_metering_3~moment,col="Blue")})
legend("topright",box.lty=0, lty=1,lwd=2,col=c("black","red","blue"),legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#4th plot

with(subset_data,plot(Global_reactive_power~moment,type="l",xlab="datetime" ))

dev.off()