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

## table(is.na(px1$Global_active_power)) ## search for NAs
with(px1, plot(datetime, Global_active_power, type="l", ## line graph
               xlab = "", 
               ylab = "Global Active Power (kilowatts)"))
dev.copy(png, "plot2.png")
dev.off()