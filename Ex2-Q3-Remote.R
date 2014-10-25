library(XML)
library(ggplot2)
library(reshape2)
library(RCurl)
library(stringr)


fbdata <- getURL("https://raw.githubusercontent.com/jrwolf/IT497/master/fitstats.csv")
fbdata <- read.table(text = fbdata, header = TRUE, sep = ",")
colnames(fbdata) <-c("Year", "Steps", "Miles")

fbdata.new <- subset(fbdata, select=c("Steps", "Miles"))

fbdata.new <- fbdata.new[-grep("\\@",fbdata.new$Steps),]
fbdata.new[order(fbdata.new[,2]), ]
ggplot(fbdata.new, aes(x = Steps, y = Miles)) + geom_point(size = 1)