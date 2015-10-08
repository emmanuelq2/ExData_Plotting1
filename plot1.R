setwd("/R/data"")
library(plyr)
library(base)
library(stats)
library(dplyr)

## read the data form the .txt file
file <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))

## convert and formatting the data field
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
file$timetemp <- paste(file$Date, file$Time)
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")

## filter the date value based on the given dates
subdate = subset(file, file$Date == "2007-02-01" | file$Date == "2007-02-02")

## Generate the graph
hist(subdate$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
