
### script for creating Figures 3 and S3 from Kyriazis et al. 2022 biorxiv

setwd("~/Documents/UCLA/simulations_review/Analysis/Data/")

### read in 1kg SFSs 
ns_sfs_1kg <- scan("1kg_nonsyn.txt")
syn_sfs_1kg <- scan("1kg_syn.txt")

### read in simulated perez SFSs
ns_sfs_perez <- read.table("perez_nonsyn.txt")
ns_sfs_perez <- colSums(ns_sfs_perez)
syn_sfs_perez <- read.table("perez_syn.txt")
syn_sfs_perez <- colSums(syn_sfs_perez)

### read in simulated henn SFSs
ns_sfs_henn <- read.table("henn_nonsyn.txt")
ns_sfs_henn <- colSums(ns_sfs_henn)
syn_sfs_henn <- read.table("henn_syn.txt")
syn_sfs_henn <- colSums(syn_sfs_henn)

### read in simulated kardos SFSs
ns_sfs_kardos <- read.table("kardos_nonsyn.txt")
ns_sfs_kardos <- colSums(ns_sfs_kardos)
syn_sfs_kardos <- read.table("kardos_syn.txt")
syn_sfs_kardos <- colSums(syn_sfs_kardos)

### read in simulated newDFE SFSs
ns_sfs_newDFE <- read.table("newDFE_nonsyn.txt")
ns_sfs_newDFE <- colSums(ns_sfs_newDFE)
syn_sfs_newDFE <- read.table("newDFE_syn.txt")
syn_sfs_newDFE <- colSums(syn_sfs_newDFE)



### main text NS SFSs
setwd("~/Documents/UCLA/simulations_review/Analysis/Plots/")
pdf("NS_SFS_dotplots.pdf", width=10, height=2.5)
par(mfrow=c(1,4))

xmax = 0.1
ymin = 1e-4
cols = c("#0072B2", "#D55E00")
allele_freq <- seq(from=1, to =864)/864

plot(allele_freq, ns_sfs_1kg/sum(ns_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.8), pch=19, main = "Kyriazis et al. 2021", ylab = "Proportion of SNPs", col = cols[1], xlab = 'Allele frequency')
points(allele_freq, ns_sfs_henn/sum(ns_sfs_henn), pch=19, col=cols[2])
legend(x = 'topright', legend = c("1000G data" ,"model"), fill = cols)

plot(allele_freq, ns_sfs_1kg/sum(ns_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.8), pch=19, main = "Kardos et al. 2021", ylab = "Proportion of SNPs", col = cols[1], xlab = 'Allele frequency')
points(allele_freq, ns_sfs_kardos/sum(ns_sfs_kardos), pch=19, col=cols[2])

plot(allele_freq, ns_sfs_1kg/sum(ns_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.8), pch=19, main = "Pérez-Periera et al. 2022", ylab = "Proportion of SNPs", col = cols[1], xlab = 'Allele frequency')
points(allele_freq, ns_sfs_perez/sum(ns_sfs_perez), pch=19, col=cols[2])

plot(allele_freq, ns_sfs_1kg/sum(ns_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.8), pch=19, main = "This paper", ylab = "Proportion of SNPs", col = cols[1], xlab = 'Allele frequency')
points(allele_freq, ns_sfs_newDFE/sum(ns_sfs_newDFE), pch=19, col=cols[2])


dev.off()




### SI SYN SFSs
setwd("~/Documents/UCLA/simulations_review/Analysis/Plots/")
pdf("SYN_SFS_dotplots.pdf", width=10, height=2.5)
par(mfrow=c(1,4))

xmax = 0.1
ymin = 1e-4
cols = c("#0072B2", "#D55E00")

plot(allele_freq, syn_sfs_1kg/sum(syn_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.6), pch=19, main = "Kyriazis et al. 2021", ylab = "Proportion of SNPs", col = cols[1], xlab = 'Allele frequency')
points(allele_freq, syn_sfs_henn/sum(syn_sfs_henn), pch=19, col=cols[2])
legend(x = 'topright', legend = c("1000G data" ,"model"), fill = cols)

plot(allele_freq, syn_sfs_1kg/sum(syn_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.6), pch=19, main = "Kardos et al. 2021", ylab = "Proportion of SNPs", col = cols[1], xlab = 'Allele frequency')
points(allele_freq, syn_sfs_kardos/sum(syn_sfs_kardos), pch=19, col=cols[2])

plot(allele_freq, syn_sfs_1kg/sum(syn_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.6), pch=19, main = "Pérez-Periera et al. 2022", ylab = "Proportion of SNPs", col = cols[1], xlab = 'Allele frequency')
points(allele_freq, syn_sfs_perez/sum(syn_sfs_perez), pch=19, col=cols[2])

plot(allele_freq, syn_sfs_1kg/sum(syn_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.6), pch=19, main = "This paper", ylab = "Proportion of SNPs", col = cols[1], xlab = 'Allele frequency')
points(allele_freq, syn_sfs_newDFE/sum(syn_sfs_newDFE), pch=19, col=cols[2])


dev.off()




### fraction of NS alleles above ~5%
864*0.05

sum(ns_sfs_1kg[43:864]/sum(ns_sfs_1kg))
sum(ns_sfs_henn[43:864]/sum(ns_sfs_henn))
sum(ns_sfs_kardos[43:864]/sum(ns_sfs_kardos))
sum(ns_sfs_perez[43:864]/sum(ns_sfs_perez))
sum(ns_sfs_newDFE[43:864]/sum(ns_sfs_newDFE))


### fraction of NS singletons
(ns_sfs_1kg/sum(ns_sfs_1kg))[1]
(ns_sfs_henn/sum(ns_sfs_henn))[1]
(ns_sfs_kardos/sum(ns_sfs_kardos))[1]
(ns_sfs_perez/sum(ns_sfs_perez))[1]
(ns_sfs_newDFE/sum(ns_sfs_newDFE))[1]







