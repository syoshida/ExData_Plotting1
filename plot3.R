source("readData.R")

#
# plot3:
# This function consists of two sub-functions
# draw(xlab, ylab, boxlwd): Draw Energy sub metering with three different variables
#                   by Time series in line chart.
#                   Options to set labels for x & y axis and type of legend box
# writeToPNG(fileName): save the line chart to a file with PNG format
#
# Example
#  > df <- readData()
#  > plot3(df)$draw()
#  > plot3(df)$saveToPNG()
#
plot3 <- function(data){
  draw <- function(xlab="", ylab="Energy sub metering", bty="o"){
    with(data, plot(Time, Sub_metering_1,
         ylab=ylab,
         xlab=xlab,
         type="n"))
    with(data, lines(Time, Sub_metering_1, col="black"))
    with(data, lines(Time, Sub_metering_2, col="red"))
    with(data, lines(Time, Sub_metering_3, col="blue"))
    with(data, legend("topright", 
           col=c("black", "red", "blue"), 
           lty=par("lty"),
           bty=bty,
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")))
  }
  
  saveToPNG <- function(fileName = "plot3.png", xlab="", ylab="Energy sub metering", bty="o"){
    png(fileName)
    draw(xlab, ylab, bty)
    dev.off()
  }
  list(draw=draw, saveToPNG=saveToPNG)
}