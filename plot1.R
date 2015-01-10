# This script produces the histogram plot for global active power. It is
# intended to be used with the full dataset file "household_power_consumption.txt",
# which should be present in the same directory as this script.
#
# The file that it produces is placed in the "figure" directory and is named
# plot1.png

file <- "household_power_consumption.txt"
outfile <- "figure/plot1.png"

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
     hist(Global_active_power, col = "red",
          xlab = "Global Active Power (kilowatts)",
          main = "Global Active Power"))
dev.off()
