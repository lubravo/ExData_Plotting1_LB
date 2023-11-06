## Extracting the data based on the two dates specified in themassignment instructions
## There will be a new file named "Household_Feb_2007.txt"
system("cat household_power_consumption.txt | grep '^[1|2]/2/2007' > household_Feb_2007.txt", intern=TRUE, ignore.stderr=TRUE)

## Read the extracted data into a dataframe (2880 Observations)
el_pow_cn<-read.table("household_Feb_2007.txt",sep=";")
## Read the original column names to the extracted data
names(el_pow_cn)<-c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Gllbal_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')


## Added a new combined column with date/time values

el_pow_cn$Full_date<-with(el_pow_cn,paste(Date,Time))
el_pow_cn$Full_date<-with(el_pow_cn,as.POSIXlt(Full_date,format= "%d/%m/%Y %H:%M:%S"))

##Rendering the plot requested

png(filename="plot2.png")
with(el_pow_cn,plot(Full_date,Global_active_power,ylab="Global.active.power(Kilowatts)",xlab="",type="l"))
## Closing the PNG Device
dev.off()