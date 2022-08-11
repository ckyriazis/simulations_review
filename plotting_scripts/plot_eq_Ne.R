
### script for creating Figure S4 in Kyriazis et al. 2022 biorxiv

setwd("~/Documents/UCLA/simulations_review/Analysis/Data/")

data <- read.csv("het_table_mammals.csv", header=T)

Ne <- data$Observed_pi/(4*1e-8)

setwd("~/Documents/UCLA/simulations_review/Analysis/Plots/")
pdf("equilibrium_Ne.pdf", width = 7, height = 4)
par(mar=c(5,5,2,2))

lwd = 4
lty = 2
hist(log(Ne), breaks=50, main="", xlab="Equilibrium effective population size", cex.lab=1.6, cex.axis=1.3, col = "gray", ylim = c(0,10))
abline(v=median(log(Ne)), lty=lty, lwd=lwd)
abline(v=log(0.001037458/4e-8), lty=lty, lwd=lwd, col='#009E73')
abline(v=log(0.000105/4e-8), lty=lty, lwd=lwd, col="#56B4E9")
legend(lty = 2, col=c('black', '#009E73','#56B4E9'), legend = c('Median','Humans','Vaquita'), x='topright', lwd=4, cex=1.4)

dev.off()

median(Ne)
mean(Ne)
quantile(Ne, probs = c(0.01,0.05,0.5,0.95))
min(Ne)
