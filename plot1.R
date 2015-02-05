source("readData.R")

#
# plot1:
# This function consists of two sub-functions
# draw(): Draw histgram of Global Active Power
# writeToPNG(fileName): save the histgram to a file with PNG format
#
# Example
#  > df <- readData()
#  > plot1(df)$draw()
#  > plot1(df)$saveToPNG()
#
plot1 <- function(data) {
  draw <- function(){
    hist(data[,"Global_active_power"],
         xlab="Global Active Power (kilowatts)", 
         main="Global Active Power",
         col="red")
  }
  saveToPNG <- function(fileName = "plot1.png"){
    png(fileName)
    draw()
    dev.off()
  }
  list(draw=draw, saveToPNG=saveToPNG)
}
