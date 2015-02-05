source("readData.R")

#
# plot2:
# This function consists of two sub-functions
# draw(xlab, ylab): draw Global Active Power usage by Time series in line chart
#                   Options to set labels for x axis and y axis
# writeToPNG(fileName): save the line chart to a file with PNG format
#
# Example
#  > df <- readData()
#  > plot2(df)$draw()
#  > plot2(df)$saveToPNG()
#
plot2 <- function(data){
  draw <- function(xlab="", ylab="Global Active Power (kilowatts)"){
    with(data, plot(Time, Global_active_power,
         ylab=ylab, 
         xlab=xlab,
         type="n"
    ))
    with(data, lines(Time, Global_active_power))
  }

  saveToPNG <- function(fileName = "plot2.png", xlab="", ylab="Global Active Power (kilowatts)"){
    png(fileName)
    draw()
    dev.off()
  }
  list(draw=draw, saveToPNG=saveToPNG)
}