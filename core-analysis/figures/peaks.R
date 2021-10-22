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
ggsave("p-num.jpeg", width = 16,
  height = 7, unit = "in", dpi = 300)

#Files of emission parameter
emp <- read.table("em-p.txt", header = T, sep = "\t")

#Subsetting the data
aat1.nf <- subset(emp, Sample %in% "aat1" & EmissionType %in% "nfr")
aat2.nf <- subset(emp, Sample %in% "aat2" & EmissionType %in% "nfr")
ant1.nf <- subset(emp, Sample %in% "ant1" & EmissionType %in% "nfr")
ant2.nf <- subset(emp, Sample %in% "ant2" & EmissionType %in% "nfr")
aat1.mo <- subset(emp, Sample %in% "aat1" & EmissionType %in% "mono")
aat2.mo <- subset(emp, Sample %in% "aat2" & EmissionType %in% "mono")
ant1.mo <- subset(emp, Sample %in% "ant1" & EmissionType %in% "mono")
ant2.mo <- subset(emp, Sample %in% "ant2" & EmissionType %in% "mono")
aat1.di <- subset(emp, Sample %in% "aat1" & EmissionType %in% "di")
aat2.di <- subset(emp, Sample %in% "aat2" & EmissionType %in% "di")
ant1.di <- subset(emp, Sample %in% "ant1" & EmissionType %in% "di")
ant2.di <- subset(emp, Sample %in% "ant2" & EmissionType %in% "di")
aat1.tr <- subset(emp, Sample %in% "aat1" & EmissionType %in% "tri")
aat2.tr <- subset(emp, Sample %in% "aat2" & EmissionType %in% "tri")
ant1.tr <- subset(emp, Sample %in% "ant1" & EmissionType %in% "tri")
ant2.tr <- subset(emp, Sample %in% "ant2" & EmissionType %in% "tri")

#Plotting 
aat1.n <- ggplot(aat1.nf, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("aat1") + scale_fill_manual(values="#fa9fb5") + geom_bar(stat="identity", position=position_dodge())
aat1.m <- ggplot(aat1.mo, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("aat1") + scale_fill_manual(values="#f768a1") + geom_bar(stat="identity", position=position_dodge())
aat1.d <- ggplot(aat1.di, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("aat1") + scale_fill_manual(values="#dd3497") + geom_bar(stat="identity", position=position_dodge())
aat1.t <- ggplot(aat1.tr, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("aat1") + scale_fill_manual(values="#ae017e") + geom_bar(stat="identity", position=position_dodge())
aat2.n <- ggplot(aat2.nf, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("aat2") + scale_fill_manual(values="#fa9fb5") + geom_bar(stat="identity", position=position_dodge())
aat2.m <- ggplot(aat2.mo, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("aat2") + scale_fill_manual(values="#f768a1") + geom_bar(stat="identity", position=position_dodge())
aat2.d <- ggplot(aat2.di, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("aat2") + scale_fill_manual(values="#dd3497") + geom_bar(stat="identity", position=position_dodge())
aat2.t <- ggplot(aat2.tr, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("aat2") + scale_fill_manual(values="#ae017e") + geom_bar(stat="identity", position=position_dodge())
ant1.n <- ggplot(ant1.nf, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("ant1") + scale_fill_manual(values="#fa9fb5") + geom_bar(stat="identity", position=position_dodge())
ant1.m <- ggplot(ant1.mo, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("ant1") + scale_fill_manual(values="#f768a1") + geom_bar(stat="identity", position=position_dodge())
ant1.d <- ggplot(ant1.di, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("ant1") + scale_fill_manual(values="#dd3497") + geom_bar(stat="identity", position=position_dodge())
ant1.t <- ggplot(ant1.tr, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("ant1") + scale_fill_manual(values="#ae017e") + geom_bar(stat="identity", position=position_dodge())
ant2.n <- ggplot(ant2.nf, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("ant2") + scale_fill_manual(values="#fa9fb5") + geom_bar(stat="identity", position=position_dodge())
ant2.m <- ggplot(ant2.mo, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("ant2") + scale_fill_manual(values="#f768a1") + geom_bar(stat="identity", position=position_dodge())
ant2.d <- ggplot(ant2.di, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("ant2") + scale_fill_manual(values="#dd3497") + geom_bar(stat="identity", position=position_dodge())
ant2.t <- ggplot(ant2.tr, aes(x=Model, y=Emission, fill=EmissionType)) + xlab("ant2") + scale_fill_manual(values="#ae017e") + geom_bar(stat="identity", position=position_dodge())

#Arrange and save
ggarrange(aat1.n, aat2.n, ant1.n, ant2.n, 
		aat1.m, aat2.m, ant1.d, ant2.t, 
		aat1.d, aat2.d, ant1.d, ant2.d, 
		aat1.t, aat2.t, ant1.t, ant2.t, 
		ncol = 4, nrow = 4)
ggsave("n-peaks.jpeg",  width = 40,
  height = 12, unit = "in", dpi = 300)
