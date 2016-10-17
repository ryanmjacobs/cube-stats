#!/usr/bin/env Rscript

library("jsonlite")

data <- fromJSON("cube-stats.json")
data$iterations     <- as.numeric(data$iterations)
data$scramble_moves <- as.numeric(data$scramble_moves)
data$moves          <- as.numeric(data$moves)

d  <- density(data$moves, adjust=2)
m  <- mean(data$moves)
sd <- sd(data$moves)

plot(d,
     main="Number of Moves to Solve a Rubik's Cube (Two-Cycle Solution)",
     xlab="Moves", ylab="Frequency")

# mean
abline(v=m,lty=2,lwd=2,col="red")

text(754, y=0.0032, sprintf("    mean = %0.1f",m),  col="blue")
text(750, y=0.0030, sprintf("std. dev = %0.1f",sd), col="blue")

# 1, 2, and 3 std. devs away from mean
#abline(v=c(m+1*sd,m-1*sd),lty=2,lwd=2,col="blue")
#abline(v=c(m+2*sd,m-2*sd),lty=2,lwd=2,col="blue")
#abline(v=c(m+3*sd,m-3*sd),lty=2,lwd=2,col="blue")

# SECONDS #

# based on prior world rec. of 5.66 seconds
d  <- density(data$moves*0.00979747273, adjust=2)
m  <- mean(data$moves*0.00979747273)
sd <- sd(data$moves*0.00979747273)
abline(v=m,lty=2,lwd=2,col="red")

plot(d,
     main="Time Solve a Rubik's Cube (Two-Cycle Solution)",
     xlab="Time (seconds)", ylab="Frequency")

# mean
abline(v=m,lty=2,lwd=2,col="red")

text(7.5, y=0.32, sprintf("    mean = %0.2f",m),  col="blue")
text(7.5, y=0.30, sprintf("std. dev = %0.2f",sd), col="blue")

# std. dev
abline(v=c(m+1*sd,m-1*sd),lty=2,lwd=2,col="blue")
