
### script for creating Figure 2 in Kyriazis et al. 2022 biorxiv


# results for new DFE
mean = 0.01314833
shape = 0.186
scale = mean/shape
g <- rgamma(n=1000000,shape = shape, scale= scale)

lethals <- g[g>0.99]
new_lethals_frac <- (length(lethals)/length(g))+0.0005
#new_lethals_h <- mean((0.5)/(1 - 7071.07*(-lethals)))
new_lethals_h <- 0

sublethals <- g[g<0.99 & g >0.1]
new_sublet_frac <- length(sublethals)/length(g)*0.995
#new_sublet_h <- mean((0.5)/(1 - 7071.07*(-sublethals)))
new_sublet_h <- 0.0

detrimentals <- g[g<0.1 & g >0.01]
new_detr_frac <- length(detrimentals)/length(g)*0.995
#new_detr_h <- mean((0.5)/(1 - 7071.07*(-detrimentals)))
new_detr_h <- 0.05

modDel <- g[g<0.01 & g >0.001]
new_modDel_frac <- length(modDel)/length(g)*0.995
#new_modDel_h <- mean((0.5)/(1 - 7071.07*(-modDel)))
new_modDel_h <- 0.2

wkDel <- g[g<0.001]
new_wkDel_frac <- length(wkDel)/length(g)*0.995
#new_wkDel_h <- mean((0.5)/(1 - 7071.07*(-wkDel)))
new_wkDel_h <- 0.45


# results for Kim 2017 DFE and Henn hs
mean = 0.01314833
shape = 0.186
scale = mean/shape
g <- rgamma(n=1000000,shape = shape, scale= scale)

lethals <- g[g>0.99]
kim_lethals_frac <- (length(lethals)/length(g))
kim_lethals_h <- mean((0.5)/(1 - 7071.07*(-lethals)))
## note that this isnt defined since no lethals so set to 0
kim_lethals_h <- 0

sublethals <- g[g<0.99 & g >0.1]
kim_sublet_frac <- length(sublethals)/length(g)
kim_sublet_h <- mean((0.5)/(1 - 7071.07*(-sublethals)))

detrimentals <- g[g<0.1 & g >0.01]
kim_detr_frac <- length(detrimentals)/length(g)
kim_detr_h <- mean((0.5)/(1 - 7071.07*(-detrimentals)))

modDel <- g[g<0.01 & g >0.001]
kim_modDel_frac <- length(modDel)/length(g)
kim_modDel_h <- mean((0.5)/(1 - 7071.07*(-modDel)))

wkDel <- g[g<0.001]
kim_wkDel_frac <- length(wkDel)/length(g)
kim_wkDel_h <- mean((0.5)/(1 - 7071.07*(-wkDel)))



# results for Kardos 2021 DFE and hs
shape = 0.5
scale = 0.1
mean = scale*shape
g <- rgamma(n=1000000,shape = shape, scale= scale)

lethals <- g[g>0.99]
kardos_lethals_frac <- (length(lethals)/length(g))+0.05
kardos_lethals_h <- mean(0.5*exp(-13*lethals))

sublethals <- g[g<0.99 & g >0.1]
kardos_sublet_frac <- (length(sublethals)/length(g))*0.95
kardos_sublet_h <- mean(0.5*exp(-13*sublethals))

detrimentals <- g[g<0.1 & g >0.01]
kardos_detr_frac <- (length(detrimentals)/length(g))*0.95
kardos_detr_h <-  mean(0.5*exp(-13*detrimentals))

modDel <- g[g<0.01 & g >0.001]
kardos_modDel_frac <- (length(modDel)/length(g))*0.95
kardos_modDel_h <- mean(0.5*exp(-13*modDel))

wkDel <- g[g<0.001]
kardos_wkDel_frac <- (length(wkDel)/length(g))*0.95
kardos_wkDel_h <- mean(0.5*exp(-13*wkDel))





# results for Pérez-Pereira 2021 DFE and hs 
mean=0.2
shape=0.33
scale=mean/shape
g <- rgamma(n=1000000,shape = shape, scale= scale)

lethals <- g[g>0.99]
perez_lethals_frac <- length(lethals)/length(g)
perez_lethals_h <- mean(0.5*exp(-7.6*lethals))

sublethals <- g[g<0.99 & g >0.1]
perez_sublet_frac <- length(sublethals)/length(g)
perez_sublet_h <- mean(0.5*exp(-7.6*sublethals))

detrimentals <- g[g<0.1 & g >0.01]
perez_detr_frac <- length(detrimentals)/length(g)
perez_detr_h <-  mean(0.5*exp(-7.6*detrimentals))

modDel <- g[g<0.01 & g >0.001]
perez_modDel_frac <- length(modDel)/length(g)
perez_modDel_h <- mean(0.5*exp(-7.6*modDel))

wkDel <- g[g<0.001]
perez_wkDel_frac <- length(wkDel)/length(g)
perez_wkDel_h <- mean(0.5*exp(-7.6*wkDel))








setwd("~/Documents/UCLA/simulations_review/Analysis/Plots/")
pdf("DFE_comparison.pdf", width = 10, height = 9)

par(mfrow=c(2,1), mar = c(5,5,2,2))

library(RColorBrewer)

labs <- 1.6
names <- 1.3
axis <- 1.3
cols <- brewer.pal(4,"Spectral")

kim_DFE_fractions <- rev(c(kim_wkDel_frac,kim_modDel_frac,kim_detr_frac,kim_sublet_frac, kim_lethals_frac))
kardos_DFE_fractions <- rev(c(kardos_wkDel_frac,kardos_modDel_frac,kardos_detr_frac,kardos_sublet_frac, kardos_lethals_frac))
perez_DFE_fractions <- rev(c(perez_wkDel_frac,perez_modDel_frac,perez_detr_frac,perez_sublet_frac, perez_lethals_frac))
new_DFE_fractions <- rev(c(new_wkDel_frac,new_modDel_frac,new_detr_frac,new_sublet_frac, new_lethals_frac))

DFEs <- rbind(kim_DFE_fractions,kardos_DFE_fractions,perez_DFE_fractions,new_DFE_fractions)
barplot(DFEs,beside=T, ylim=c(0,0.5), xlab="selection coefficient (s)", ylab="fraction of new mutations",names.arg = c("-1.0","(-1, -0.1]", "(-0.1, -0.01]","(-0.01, -0.001]", "(-0.001, 0.0)"), 
        cex.lab = labs, col=cols, cex.names=names,cex.axis = axis)
legend("topleft", legend=c("Kyriazis et al. 2021","Kardos et al. 2021","Pérez-Pereira et al. 2022","This paper"), fill=cols, cex=1.2, bty = "n")


kim_hs <- rev(c(kim_wkDel_h,kim_modDel_h,kim_detr_h,kim_sublet_h, kim_lethals_h))
kardos_hs <- rev(c(kardos_wkDel_h,kardos_modDel_h,kardos_detr_h,kardos_sublet_h, kardos_lethals_h))
perez_hs <- rev(c(perez_wkDel_h,perez_modDel_h,perez_detr_h,perez_sublet_h, perez_lethals_h))
new_hs <- rev(c(new_wkDel_h,new_modDel_h,new_detr_h,new_sublet_h, new_lethals_h))

size <- 2
plot(kim_hs, col = cols[1], pch=19, cex = size,ylim=c(0,.5), xlab="selection coefficient (s)", ylab="dominance coefficient (h)", xaxt = "n", cex.lab = labs, cex.axis = axis)
lines(kim_hs, lwd=size, lty=2,col = cols[1])
points(kardos_hs,col = cols[2], pch=19, cex = size)
lines(kardos_hs, lwd=size, lty=2,col = cols[2])
points(perez_hs,col = cols[3], pch=19, cex = size)
lines(perez_hs, lwd=size, lty=2,col = cols[3])
points(new_hs,col = cols[4], pch=19, cex = size)
lines(new_hs, lwd=size, lty=2,col = cols[4])

axis(1, at=1:5, labels=c("-1.0","(-1, -0.1]", "(-0.1, -0.01]","(-0.01, -0.001]", "(-0.001, 0.0)"), cex.axis=axis)
legend("topleft", legend=c("Kyriazis et al. 2021","Kardos et al. 2021","Pérez-Pereira et al. 2022","This paper"), fill=cols, cex=1.2, bty = "n")


dev.off()










