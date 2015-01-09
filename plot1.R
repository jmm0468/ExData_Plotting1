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
