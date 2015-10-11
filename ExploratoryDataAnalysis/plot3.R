pxURL<-c("./exdata-data-household_power_consumption/household_power_consumption.txt")
px1<-read.table(pxURL, sep=";", stringsAsFactors = FALSE, 
                na.strings = "?", header = FALSE, comment.char = "", 
                skip = 66637, nrows = 2880)
vars<-read.table(pxURL, sep=";", stringsAsFactors = FALSE, 
                 header = FALSE, nrows = 1)
colnames(px1)<-vars
px1$Date<-as.Date(px1$Date, "%d/%m/%Y")
px1$temp<-paste(px1$Date, px1$Time)
px1$datetime<-strptime(px1$temp, "%Y-%m-%d %H:%M:%S")

## table(is.na(px1$Sub_metering_1)) ## search for NAs
png(file = "plot3.png") ## output directly to png device
with(px1, plot(datetime, Sub_metering_1, type="l", col = "black", ## black line graph
               xlab = "", 
               ylab = "Energy sub metering"))
with(subset(px1), points(datetime, Sub_metering_2, 
                         type="l", col = "red")) ## red line graph
with(subset(px1), points(datetime, Sub_metering_3,
                         type="l", col = "blue")) ## blue line graph
legend("topright", col = c("black", "red", "blue"), pch = "-", xjust=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()