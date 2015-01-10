# This script produces the global active power line plot. It is
# intended to be used with the full dataset file "household_power_consumption.txt",
# which should be present in the same directory as this script.
#
# The file that it produces is placed in the "figure" directory and is named
# plot2.png

file <- "household_power_consumption.txt"
outfile <- "figure/plot2.png"

sep <- ";"
names <- names(read.csv(file = file, header = T,
                        sep = sep, nrows = 1))
power <- read.csv(file = file, header = F, na.strings = "?",
                  sep = sep, skip = 66637, nrows = 2880)
names(power) <- names
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Time <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

png(file = outfile, width = 480, height = 480, bg = "transparent")
with(power,
     plot(Time, Global_active_power, type = "l", xlab = "",
          ylab = "Global Active Power (kilowatts)"))
dev.off()
