source("readData.R")
source("plot2.R")
source("plot3.R")

#
# plotVoltage(data):
# This function plot Voltage by Time series in line chart
#
plotVoltage <- function(data) {
  with(data, plot(Time, Voltage,
       ylab="Voltage", 
       xlab="datetime",
       type="n"
  ))
  with(data, lines(Time, Voltage))
}

#
# plotGlobalReactivePower(data)
# This function plot Global Reactive Power by Time series in line chart
#
plotGlobalReactivePower <- function(data) {
  with(data, plot(Time, Global_reactive_power,
       ylab="Global_reactive_power", 
       xlab="datetime",
       type="n"
  ))
  with(data, lines(Time, Global_reactive_power))
}

#
# plot4(data):
# This function consists of two sub-functions
# draw(): Draw four charts in 2x2 format
# writeToPNG(fileName): save four charts in 2x2 format to a file with PNG format
#
# Example
#  > df <- readData()
#  > plot3(df)$draw()
#  > plot3(df)$saveToPNG()
#
plot4 <- function(data) {
  draw <- function(){
    par(mfrow = c(2,2))
    plot2(data)$draw(ylab="Global Active Power")
    plotVoltage(data)
    plot3(data)$draw(bty="n")
    plotGlobalReactivePower(data)
  }
  saveToPNG <- function(fileName = "plot4.png"){
    png(fileName)
    draw()
    dev.off()
  }
  list(draw=draw, saveToPNG=saveToPNG)
}