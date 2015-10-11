pxURL<-c("./exdata-data-household_power_consumption/household_power_consumption.txt")
px1<-read.table(pxURL, sep=";", stringsAsFactors = FALSE, 
                  na.strings = "?", header = FALSE, comment.char = "", 
                  skip = 66637, nrows = 2880)
vars<-read.table(pxURL, sep=";", stringsAsFactors = FALSE, 
                 header = FALSE, nrows = 1)
colnames(px1)<-vars

## table(is.na(px1$Global_active_power)) ## search for NAs
hist(px1$Global_active_power, 
     col="red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()