#Libraries
library(ggplot2)
library(ggpubr)

#Load files
peak <- read.table("peaks.txt", header = T, sep = "\t")
aat1.p <- subset(peak, Sample == "aat1")
aat2.p <- subset(peak, Sample == "aat2")
ant1.p <- subset(peak, Sample == "ant1")
ant2.p <- subset(peak, Sample == "ant2")

#Plotting
p.a1 <- ggplot(aat1.p, aes(Model, Peaks, group = 1)) + xlab("aat1") + ylab("Peaks") + geom_line() + geom_point()
p.a2 <- ggplot(aat2.p, aes(Model, Peaks, group = 1)) + xlab("aat2") + ylab("Peaks") + geom_line() + geom_point()
p.n1 <- ggplot(ant1.p, aes(Model, Peaks, group = 1)) + xlab("ant1") + ylab("Peaks") + geom_line() + geom_point()
p.n2 <- ggplot(ant2.p, aes(Model, Peaks, group = 1)) + xlab("ant2") + ylab("Peaks") + geom_line() + geom_point()

#Arrange and save
ggarrange(p.a1, p.a2, p.n1, p.n2, 
		ncol = 2, nrow = 2)	
ggsave("peaks.png", width = 16,
  height = 7, unit = "in", dpi = 600)
