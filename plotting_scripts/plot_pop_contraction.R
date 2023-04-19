### script for creating Figures S6 from Kyriazis et al. 2023 AmNat


### results for contraction from 20,000 to 100
# note that pop contraction starts at gen 5000
# need to first set working directory to ~/data/pop_contr_100
datafiles <- list.files(pattern="0.o")

# read in data
data_100 <- data.frame(matrix(nrow = 0, ncol = 14))

for(rep in seq_along(datafiles)){
  data <- read.table(datafiles[rep], sep=",", header=F, skip = 22523)
  data_100 <- rbind(data_100,cbind(data,rep))
}

colnames(data_100) <- c("gen","popSize","genLoad","inbLoad","lethal_seg","sublet_seg","strDel_seg","modDel_seg","wkDel_seg","lethal_fix","sublet_fix","strDel_fix","modDel_fix","wkDel_fix") 

## get mean of all reps for N=100
gens <- unique(data_100$gen)
means_100 <- data.frame(matrix(nrow = 0, ncol = 14))

for(gen in gens){
  data_this_gen <- data_100[which(data_100$gen==gen),]
  means_100 <- rbind(means_100,colMeans(data_this_gen))
  
}
colnames(means_100) <- colnames(data_100)




### results for contraction from 20,000 to 1000
# note that pop contraction starts at gen 5000
# need to set working directory to ~/data/pop_contr_1000
datafiles <- list.files(pattern="0.o")

# read in data
data_1000 <- data.frame(matrix(nrow = 0, ncol = 14))

for(rep in seq_along(datafiles)){
  data <- read.table(datafiles[rep], sep=",", header=F, skip = 22523)
  data_1000 <- rbind(data_1000,cbind(data,rep))
}

colnames(data_1000) <- c("gen","popSize","genLoad","inbLoad","lethal_seg","sublet_seg","strDel_seg","modDel_seg","wkDel_seg","lethal_fix","sublet_fix","strDel_fix","modDel_fix","wkDel_fix") 

# get mean of all reps
gens <- unique(data_1000$gen)
means_1000 <- data.frame(matrix(nrow = 0, ncol = 14))

for(gen in gens){
  data_this_gen <- data_1000[which(data_1000$gen==gen),]
  means_1000 <- rbind(means_1000,colMeans(data_this_gen))
  
}
colnames(means_1000) <- colnames(data_1000)




## plot inbreeding load after contraction for N=100 and N=1000 both side by side
pdf("pop_contraction_load.pdf", width = 7, height = 5)

plot(means_1000$gen,means_1000$inbLoad , xlim=c(5000,6000), type = "l", ylim = c(0,6), lwd=5, xlab = "Generations after contraction", ylab = "Inbreeding load (2B)", cex.lab=1.3, col = "#E69F00", xaxt = 'n')
axis(1, at=seq(from=5000, to=6000, by=100), labels=seq(from=0, to=1000, by=100))
lines(means_100$gen,means_100$inbLoad, lwd=5, col ="#D55E00")
legend(x="topright",legend = c("N=100", "N=1000"), col=c("#D55E00", "#E69F00"), lty=1, lwd=5, cex=1.3)

dev.off()




