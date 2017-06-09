
#read data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")

#subset data

subset_data<-data[data$Date %in% c("1/2/2007" ,"2/2/2007") ,]

#add new colummn "moment"
subset_data<-mutate(subset_data,moment=dmy_hms(paste(Date,Time)))


#build plot
subset_data[,"Global_active_power"]<-as.numeric(subset_data[,"Global_active_power"])

png(file= "plot3.png", width = 480, height = 480)

with(data2,{plot(Sub_metering_1~moment,type="l",xlab="",ylab="Energy sub metering")
        lines(Sub_metering_2~moment,col="Red")
        lines(Sub_metering_3~moment,col="Blue")})
legend("topright", lty=1,lwd=2,col=c("black","red","blue"),legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()