file <- "household_power_consumption.txt"
outfile <- "figure/plot4.png"

sep <- ";"
names <- names(read.csv(file = file, header = T,
                        sep = sep, nrows = 1))
power <- read.csv(file = file, header = F, na.strings = "?",
                  sep = sep, skip = 66637, nrows = 2880)
names(power) <- names
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Time <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

png(file = outfile, width = 480, height = 480, bg = "transparent")
par(mfrow = c(2,2))
with(power,
     plot(Time, Global_active_power, type = "l", xlab = "",
          ylab = "Global Active Power"))
with(power,
     plot(Time, Voltage, type = "l", xlab = "datetime"))
with(power, {
  plot(Time, Sub_metering_1, col = "black",
       type = "l", xlab = "", ylab = "Energy sub metering");
  lines(Time, Sub_metering_2, col = "red");
  lines(Time, Sub_metering_3, col = "blue");
  legend("topright", lty = 1, col = c("black", "red", "blue"),
         legend = names(power)[7:9], box.lty = 0)
})
with(power,
     plot(Time, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()


