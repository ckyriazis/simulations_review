### script for creating Figure 1 in Kyriazis et al. 2022 biorxiv


get_DFE_fracs <- function(shape, scale){
  g <- rgamma(n=1000000,shape = shape, scale= scale)
  
  lethals <- g[g>0.99]
  lethals_frac <- length(lethals)/length(g)
  
  sublethals <- g[g<0.99 & g >0.1]
  sublet_frac <- length(sublethals)/length(g)
  
  strDel <- g[g<0.1 & g >0.01]
  strDel_frac <- length(strDel)/length(g)
  
  modDel <- g[g<0.01 & g >0.001]
  modDel_frac <- length(modDel)/length(g)
  
  wkDel <- g[g<0.001]
  wkDel_frac <- length(wkDel)/length(g)
  
  return(c(lethals_frac,sublet_frac,strDel_frac,modDel_frac,wkDel_frac))
}


# results for Kim 2017 DFE and Henn hs
mean = 0.01314833
shape = 0.186
scale = mean/shape
g <- rgamma(n=1000000,shape = shape, scale= scale)
kim_DFE_fracs <- get_DFE_fracs(shape,scale)

# results for Boyko 2008 DFE
shape = 0.184 
scale = 8200/25636
mean = scale*shape
g <- rgamma(n=1000000,shape = shape, scale= scale)
boyko_DFE_fracs <- get_DFE_fracs(shape,scale)

# Eyre walker 
shape=0.23
mean=0.043
scale = mean/shape
g <- rgamma(n=1000000,shape = shape, scale= scale)
eyrewalker_DFE_fracs <- get_DFE_fracs(shape,scale)

# results for Vaquita DFE
mean = 0.0257224845852388
shape = 0.13139582
scale = mean/shape
g <- rgamma(n=1000000,shape = shape, scale= scale)
vaquita_DFE_fracs <- get_DFE_fracs(shape,scale)

# mouse from huber 2017
shape=0.22
scale=0.016
g <- rgamma(n=1000000,shape = shape, scale= scale)
mouse_DFE_fracs <- get_DFE_fracs(shape,scale)

# yeast from huber 2017
shape=0.22
scale=3.7e-04
g <- rgamma(n=1000000,shape = shape, scale= scale)
yeast_DFE_fracs <- get_DFE_fracs(shape,scale)

# drosophila from huber 2017
shape=0.35
scale=3.8e-04
g <- rgamma(n=1000000,shape = shape, scale= scale)
dmel_DFE_fracs <- get_DFE_fracs(shape,scale)

# arabidopsis
mean = 0.00048655
shape = 0.185
scale = mean/shape
g <- rgamma(n=1000000,shape = shape, scale= scale)
arab_DFE_fracs <- get_DFE_fracs(shape,scale)

# orangutans
shape=0.16
scale=14392/17934
g <- rgamma(n=1000000,shape = shape, scale= scale)
orang_DFE_fracs <- get_DFE_fracs(shape,scale)



setwd("~/Documents/UCLA/simulations_review/Analysis/Plots/")
pdf("plot_all_DFEs.pdf", width = 10, height = 5)

par(mar=c(5,5,2,2))
library("RColorBrewer")
cols <- c(brewer.pal(3,"Blues"),brewer.pal(3,"Greens"),brewer.pal(3,"Reds"))

DFEs <- rbind(kim_DFE_fracs,boyko_DFE_fracs,eyrewalker_DFE_fracs,orang_DFE_fracs,vaquita_DFE_fracs,mouse_DFE_fracs,yeast_DFE_fracs,dmel_DFE_fracs,arab_DFE_fracs)
barplot(DFEs,beside=T, ylim=c(0,1), xlab="selection coefficient (s)", ylab="fraction of new mutations",
        names.arg = c("-1.0","(-1, -0.1]", "(-0.1, -0.01]","(-0.01, -0.001]", "(-0.001, 0.0)"), cex.lab = 1.8, col=cols, cex.names =1.3, cex.axis=1.3)
legend("topleft", legend=c("Humans (Kim et al. 2017)","Humans (Boyko et al. 2008)","Humans (Eyre-Walker et al. 2006)", "Orangutans (Ma et al. 2013)", "Vaquita (Robinson et al. 2022)","Mice (Huber et al. 2017)","Drosophila (Huber et al. 2017)","Yeast (Huber et al. 2017)","Arabidopsis (Huber et al. 2018)" ), 
       fill=cols, cex=1.2, bty = "n")

dev.off()

