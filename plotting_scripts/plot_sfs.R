
### script for creating Figures 3 and S3 from Kyriazis et al. 2023 AmNat

# read in data
# setwd to directory containing data files

### read in 1kg SFSs 
ns_sfs_1kg <- scan("1kg_nonsyn.txt")
ns_sfs_1kg <- replace(ns_sfs_1kg, ns_sfs_1kg==0, 1) # replace all zeros in SFS with 1 for log plotting
syn_sfs_1kg <- scan("1kg_syn.txt")
syn_sfs_1kg <- replace(syn_sfs_1kg, syn_sfs_1kg==0, 1)


### read in simulated perez 2022 SFSs
ns_sfs_perez <- read.table("perez_nonsyn.txt")
ns_sfs_perez <- colSums(ns_sfs_perez)
ns_sfs_perez <- replace(ns_sfs_perez, ns_sfs_perez==0, 1)
syn_sfs_perez <- read.table("perez_syn.txt")
syn_sfs_perez <- colSums(syn_sfs_perez)
syn_sfs_perez <- replace(syn_sfs_perez, syn_sfs_perez==0, 1)


### read in simulated Kyriazis 2021 SFSs 
ns_sfs_kyriazis <- read.table("henn_nonsyn.txt")
ns_sfs_kyriazis <- colSums(ns_sfs_kyriazis)
ns_sfs_kyriazis <- replace(ns_sfs_kyriazis, ns_sfs_kyriazis==0, 1)
syn_sfs_kyriazis <- read.table("henn_syn.txt")
syn_sfs_kyriazis <- colSums(syn_sfs_kyriazis)
syn_sfs_kyriazis <- replace(syn_sfs_kyriazis, syn_sfs_kyriazis==0, 1)

### read in simulated kardos 2021 SFSs
ns_sfs_kardos <- read.table("kardos_nonsyn.txt")
ns_sfs_kardos <- colSums(ns_sfs_kardos)
ns_sfs_kardos <- replace(ns_sfs_kardos, ns_sfs_kardos==0, 1)
syn_sfs_kardos <- read.table("kardos_syn.txt")
syn_sfs_kardos <- colSums(syn_sfs_kardos)
syn_sfs_kardos <- replace(syn_sfs_kardos, syn_sfs_kardos==0, 1)

### read in simulated newDFE SFSs
ns_sfs_newDFE <- read.table("newDFE_nonsyn.txt")
ns_sfs_newDFE <- colSums(ns_sfs_newDFE)
ns_sfs_newDFE <- replace(ns_sfs_newDFE, ns_sfs_newDFE==0, 1)
syn_sfs_newDFE <- read.table("newDFE_syn.txt")
syn_sfs_newDFE <- colSums(syn_sfs_newDFE)
syn_sfs_newDFE <- replace(syn_sfs_newDFE, syn_sfs_newDFE==0, 1)



### plot main text NS SFSs (Fig 3)
pdf("NS_SFS_dotplots.pdf", width=10, height=3)
par(mfrow=c(1,4), mar=c(5,4.5,4,0.1))

xmax = 0.1
ymin = 1e-4
cols = c("#0072B2", "#D55E00")
allele_freq <- seq(from=1, to =864)/864
lab=1.6
axis=1.2
title=1.5

plot(allele_freq, ns_sfs_1kg/sum(ns_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.8), pch=19, main = "Kyriazis et al. 2021", ylab = "Proportion of SNPs", col = cols[1], xlab = 'Allele frequency', cex.lab=lab, cex.axis=axis, cex.main=title)
points(allele_freq, ns_sfs_kyriazis/sum(ns_sfs_kyriazis), pch=19, col=cols[2])
legend(x = 'topright', legend = c("1000G data" ,"model"), fill = cols, cex=1.5)

plot(allele_freq, ns_sfs_1kg/sum(ns_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.8), pch=19, main = "Kardos et al. 2021", ylab = "", col = cols[1], xlab = 'Allele frequency', cex.lab=lab, cex.axis=axis, cex.main=title)
points(allele_freq, ns_sfs_kardos/sum(ns_sfs_kardos), pch=19, col=cols[2])

plot(allele_freq, ns_sfs_1kg/sum(ns_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.8), pch=19, main = "Pérez-Periera et al. 2022", ylab = "", col = cols[1], xlab = 'Allele frequency', cex.lab=lab, cex.axis=axis, cex.main=title)
points(allele_freq, ns_sfs_perez/sum(ns_sfs_perez), pch=19, col=cols[2])

plot(allele_freq, ns_sfs_1kg/sum(ns_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.8), pch=19, main = "This study", ylab = "", col = cols[1], xlab = 'Allele frequency', cex.lab=lab, cex.axis=axis, cex.main=title)
points(allele_freq, ns_sfs_newDFE/sum(ns_sfs_newDFE), pch=19, col=cols[2])

dev.off()




### plot SI SYN SFSs (Fig S3)
pdf("SYN_SFS_dotplots.pdf", width=10, height=3)
par(mfrow=c(1,4), mar=c(5,4.5,4,0.1))

xmax = 0.1
ymin = 1e-4
cols = c("#0072B2", "#D55E00")
allele_freq <- seq(from=1, to =864)/864
lab=1.6
axis=1.2
title=1.5

plot(allele_freq, syn_sfs_1kg/sum(syn_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.6), pch=19, main = "Kyriazis et al. 2021", ylab = "Proportion of SNPs", col = cols[1], xlab = 'Allele frequency', cex.lab=lab, cex.axis=axis, cex.main=title)
points(allele_freq, syn_sfs_kyriazis/sum(syn_sfs_kyriazis), pch=19, col=cols[2])
legend(x = 'topright', legend = c("1000G data" ,"model"), fill = cols, cex=1.5)

plot(allele_freq, syn_sfs_1kg/sum(syn_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.6), pch=19, main = "Kardos et al. 2021", ylab = "", col = cols[1], xlab = 'Allele frequency', cex.lab=lab, cex.axis=axis, cex.main=title)
points(allele_freq, syn_sfs_kardos/sum(syn_sfs_kardos), pch=19, col=cols[2])

plot(allele_freq, syn_sfs_1kg/sum(syn_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.6), pch=19, main = "Pérez-Periera et al. 2022", ylab = "", col = cols[1], xlab = 'Allele frequency', cex.lab=lab, cex.axis=axis, cex.main=title)
points(allele_freq, syn_sfs_perez/sum(syn_sfs_perez), pch=19, col=cols[2])

plot(allele_freq, syn_sfs_1kg/sum(syn_sfs_1kg), xlim=c(0,xmax), log='y', ylim=c(ymin, 0.6), pch=19, main = "This study", ylab = "", col = cols[1], xlab = 'Allele frequency', cex.lab=lab, cex.axis=axis, cex.main=title)
points(allele_freq, syn_sfs_newDFE/sum(syn_sfs_newDFE), pch=19, col=cols[2])


dev.off()




### calculate fraction of NS alleles above ~5%
# what is cutoff for 5%? note that 864 is haploid sample size
864*0.05 

sum(ns_sfs_1kg[43:864]/sum(ns_sfs_1kg))
sum(ns_sfs_kyriazis[43:864]/sum(ns_sfs_kyriazis))
sum(ns_sfs_kardos[43:864]/sum(ns_sfs_kardos))
sum(ns_sfs_perez[43:864]/sum(ns_sfs_perez))
sum(ns_sfs_newDFE[43:864]/sum(ns_sfs_newDFE))


### calculate fraction of NS singletons
(ns_sfs_1kg/sum(ns_sfs_1kg))[1]
(ns_sfs_kyriazis/sum(ns_sfs_kyriazis))[1]
(ns_sfs_kardos/sum(ns_sfs_kardos))[1]
(ns_sfs_perez/sum(ns_sfs_perez))[1]
(ns_sfs_newDFE/sum(ns_sfs_newDFE))[1]







