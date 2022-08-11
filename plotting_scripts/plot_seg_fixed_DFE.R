

### script for creating Figures S1 and S2 in Kyriazis et al. 2022 biorxiv


setwd("~/Documents/UCLA/simulations_review/Analysis/Data")
# gen,popSize,genLoad,inbLoad,lethal_seg,sublet_seg,strDel_seg,modDel_seg,wkDel_seg,lethal_fix,sublet_fix,strDel_fix,modDel_fix,wkDel_fix,  

# DFE for new mutations from Kyriazis et al 2022 model (Kim 2017 DFE + 0.3% lethals)
new_mut_fracs <- c(0.3, 2.541*.997, 23.887*.997,24.71*.997,48.862*.997)
new_mut_fracs <- new_mut_fracs/sum(new_mut_fracs)

# distribution of segregating and fixed s from slim output - N = 5000
data_N5000 <- read.csv("seg_fix_load_sim_N5000_output.txt", header=F)
data_N5000_means <- colMeans(data_N5000)
seg_muts_N5000 <- data_N5000_means[5:9]
fixed_muts_N5000 <- data_N5000_means[10:14]

# distribution of segregating and fixed s from slim output - N = 500
data_N500 <- read.csv("seg_fix_load_sim_N500_output.txt", header=F)
data_N500_means <- colMeans(data_N500)
seg_muts_N500 <- data_N500_means[5:9]
fixed_muts_N500 <- data_N500_means[10:14]

# distribution of segregating and fixed s from slim output - N = 50
data_N50 <- read.csv("seg_fix_load_sim_N50_output.txt", header=F)
data_N50_means <- colMeans(data_N50)
seg_muts_N50 <- data_N50_means[5:9]
fixed_muts_N50 <- data_N50_means[10:14]



### plot histograms of new, segregating, and fixed s
setwd("~/Documents/UCLA/simulations_review/Analysis/Plots/")
pdf("seg_fix_muts_onlyDeleterious.pdf", width = 6, height=7)

par(mfrow=c(3,1), mar = c(5,5,2,1))

library("RColorBrewer")

cols = brewer.pal(3, "Reds")   

# N=5000
barplot(rbind(new_mut_fracs,seg_muts_N5000/sum(seg_muts_N5000), fixed_muts_N5000/sum(fixed_muts_N5000)), beside = T, names.arg = c("-1.0","(-1, -0.1]", "(-0.1, -0.01]","(-0.01, -0.001]", "(-0.001, 0.0)"), main = "Ne=5000" ,
        ylim = c(0,1), xlab = "selection coefficient (s)", ylab = "fraction of mutations", cex.lab=1.3, col=cols)
legend("topleft", c("new","segregating", "fixed"), cex=1.3, bty="n", fill = cols)


# N=500
barplot(rbind(new_mut_fracs,seg_muts_N500/sum(seg_muts_N500), fixed_muts_N500/sum(fixed_muts_N500)), beside = T, names.arg = c("-1.0","(-1, -0.1]", "(-0.1, -0.01]","(-0.01, -0.001]", "(-0.001, 0.0)"), main = "Ne=500" ,
        ylim = c(0,1), xlab = "selection coefficient (s)", ylab = "fraction of mutations", cex.lab=1.3, col=cols)
legend("topleft", c("new","segregating", "fixed"), cex=1.3, bty="n", fill = cols)


# N=50
barplot(rbind(new_mut_fracs,seg_muts_N50/sum(seg_muts_N50), fixed_muts_N50/sum(fixed_muts_N50)), beside = T, names.arg = c("-1.0","(-1, -0.1]", "(-0.1, -0.01]","(-0.01, -0.001]", "(-0.001, 0.0)"), main = "Ne=50" ,
        ylim = c(0,1), xlab = "selection coefficient (s)", ylab = "fraction of mutations", cex.lab=1.3, col=cols)
legend("topleft", c("new","segregating", "fixed"), cex=1.3, bty="n", fill = cols)

dev.off()






### plot genetic load and inbreeding load
setwd("~/Documents/UCLA/simulations_review/Analysis/Plots/")
pdf("load_example.pdf", width = 8, height=4.5)
par(mfrow=c(1,2))

boxplot(data_N50$V3,data_N500$V3,data_N5000$V3, ylab = "Genetic load (L)", names = c(50,500,5000), ylim = c(0,1), col = "gray", xlab = "Effective population size (Ne)", cex.lab=1.25, cex.axis=1.1)
boxplot(data_N50$V4,data_N500$V4,data_N5000$V4, ylab = "Inbreeding load (2B)", names = c(50,500,5000), ylim = c(0,4), col = 'gray', xlab = "Effective population size (Ne)", cex.lab=1.25, cex.axis=1.1)

dev.off()


### mean genetic load
mean(data_N50$V3)
mean(data_N500$V3)
mean(data_N5000$V3)

### mean inbreeding load
mean(data_N50$V4)
mean(data_N500$V4)
mean(data_N5000$V4)



