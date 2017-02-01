## Simulation tests for SPM R-package

library(stpm)

#setwd("~/Projects/spm_sim2/")
#setwd("/Volumes/G/spm_sim2/")
#source('/Volumes/G/spm_sim2/sim.cont.R')
setwd("C:\\spm_sim2\\")



# Number of individuals:
N <- 5000

# Number of simulations:
nsim <- 100

# Continuous case:
for(i in 1:nsim) {
  dat <- simdata_cont2(N=N, 
                      a=matrix(c(-0.1,  0.001, 0.001, -0.1), nrow = 2, ncol = 2, byrow = T),
                       f1=t(matrix(c(100, 200), nrow = 2, ncol = 1, byrow = F)),
                       Q=matrix(c(1e-06, 1e-7, 1e-7,  1e-06), nrow = 2, ncol = 2, byrow = T),
                       f=t(matrix(c(100, 200), nrow = 2, ncol = 1, byrow = F)),
                       b=matrix(c(1, 2), nrow = 2, ncol = 1, byrow = F),
                       mu0=1e-4,
                       theta=0.08,
                       ystart = c(100,200), k=2, sd0=c(5, 10), dt=1)
  
  
  colnames(dat)[5:8] <- c("var1","var1.next", "var2", "var2.next")
  
  write.table(x=dat, file=paste("sim_cont_var1_var2_", format(N, scientific=FALSE), "_", i, ".csv", sep=""),row.names = FALSE, quote = FALSE) 
  cat("Cont. simulation, var1, var2, Num:", i, "\n")
}