
#read data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")

#subset data

subset_data<-data[data$Date %in% c("1/2/2007" ,"2/2/2007") ,]

#add new colummn "moment"
subset_data<-mutate(subset_data,moment=dmy_hms(paste(Date,Time)))


#build plot
subset_data[,"Global_active_power"]<-as.numeric(subset_data[,"Global_active_power"])

png(file= "plot2.png", width = 480, height = 480)

with(subset_data,plot(Global_active_power~moment,type="l",xlab="",ylab="Global Active Power (kilowatts)" ))



dev.off()