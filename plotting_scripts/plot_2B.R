
### Script for creating Figures 4, S5, and S6 in Kyriazis et al. 2022 biorxiv

### read in simulation output
# B is total diploid inbreeding load (2B)
# B_01 is inbreeding load due to mutations with s<=-0.1
# B_099 is inbreeding load due to mutations with s<=-0.99
setwd("~/Documents/UCLA/simulations_review/Analysis/Data/")
newDFE_data <- read.csv("newDFE_2B_sim.csv")
perez_data <- read.csv("perez_2B_sim.csv")
kardos_data <- read.csv("kardos_2B_sim.csv")
kyriazis_data <- read.csv("kyriazis_2B_sim.csv")



setwd("~/Documents/UCLA/simulations_review/Analysis/Plots/")
pdf("2B_comparison.pdf", width = 8, height = 6)
par(mar=c(5,5,2,2))

library(RColorBrewer)

cols <- rev(brewer.pal(3,"Blues"))

# subtract quantities from each other to get load from detrimentals (s>-0.1), semi-lethals (-0.99<s=<-0.1), and lethals (s<=0.99)
B_detrimental <- c(kyriazis_data[125,3]-kyriazis_data[125,4],kardos_data[125,3]-kardos_data[125,4],perez_data[125,3]-perez_data[125,4],newDFE_data[125,3]-newDFE_data[125,4])
B_sublethal <-  c(kyriazis_data[125,4]-kyriazis_data[125,5], kardos_data[125,4]-kardos_data[125,5],perez_data[125,4]-perez_data[125,5],newDFE_data[125,4]-newDFE_data[125,5])
B_lethal <- c(kyriazis_data[125,5],kardos_data[125,5],perez_data[125,5],newDFE_data[125,5])
B_data <- rbind(B_lethal,B_sublethal,B_detrimental)


barplot(as.matrix(B_data), names.arg = c( "Kyriazis et al. 2021", "Kardos et al. 2021","Pérez-Pereira et al. 2022","This paper"), 
        col = cols, ylim=c(0,30), ylab = "Inbreeding load (2B)", 
        cex.lab = 1.5, cex.names = 1.1, cex.axis=1.1)
legend("topleft",  fill = rev(cols), c("Detrimental","Semi-lethal","Lethal"), cex=1.3, bty = "n")
abline(h=0.6, lty=2, lwd=2,col = 1)
abline(h=1.4, lty=2, lwd=2,col = 1)
abline(h=3.1, lty=2, lwd=2,col = 1)
abline(h=4.5, lty=2, lwd=2,col = 1)

dev.off()




### plot with U rescaled (U=1.2 for kardos and U=0.4 for Perez)
setwd("~/Documents/UCLA/simulations_review/Analysis/Plots/")
pdf("2B_comparison_rescaleU.pdf", width = 8, height = 6)
par(mar=c(5,5,2,2))

rescale <-c(0.42/0.6,1.2/0.6,0.4/0.6,1)

B_data_rescaled <- mapply("*",as.data.frame(B_data),rescale)

barplot(as.matrix(B_data_rescaled), names.arg = c( "Kyriazis et al. 2021", "Kardos et al. 2021","Pérez-Pereira et al. 2022","This paper"), 
        col = cols, ylim=c(0,40), ylab = "Inbreeding load (2B)", 
        cex.lab = 1.5, cex.names = 1.1, cex.axis=1.1)
legend("topleft",  fill = rev(cols), c("Detrimental","Semi-lethal","Lethal"), cex=1.3, bty = "n")
abline(h=0.6, lty=2, lwd=2,col = 1)
abline(h=1.4, lty=2, lwd=2,col = 1)
abline(h=3.1, lty=2, lwd=2,col = 1)
abline(h=4.5, lty=2, lwd=2,col = 1)


dev.off()






### plot 2B over time during simulations

setwd("~/Documents/UCLA/simulations_review/Analysis/Plots/")
pdf("2B_burnin.pdf", width = 7, height = 6)

library("RColorBrewer")
cols <-brewer.pal(4,"Spectral")

lwd = 4

plot(kyriazis_data$gen, kyriazis_data$B,  type = 'l', lwd=lwd, ylim = c(0,30), col = cols[1], xlab = "Generation", ylab = "Inbreeding load (2B)", cex.lab = 1.3, cex.axis=1.2)
lines(kardos_data$gen, kardos_data$B,lwd=lwd, col = cols[2])
lines(perez_data$gen, perez_data$B,lwd=lwd, col = cols[3])
lines(newDFE_data$gen, newDFE_data$B, lwd=lwd, col = cols[4])

legend("topleft", legend=c("Kyriazis et al. 2021", "Kardos et al. 2021", "Pérez-Pereira et al. 2022", "This paper"), fill=cols, cex=1.1)


dev.off()



