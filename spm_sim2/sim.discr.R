## Simulation tests for SPM R-package

library(stpm)

setwd("C:\\spm_sim2")

# Number of individuals:
N <- 5000

# Number of simulations:
nsim <- 100

# Discrete case:
for(i in 1:nsim) {
  #i=1
  dat <- simdata_discr(N=N, 
                       a=matrix(c(-0.05,  0.001, 0.001, -0.05), nrow = 2, ncol = 2, byrow = T),
                       f1=t(matrix(c(100, 200), nrow = 2, ncol = 1, byrow = F)),
                       Q=matrix(c(1e-06, 1e-7, 1e-7,  1e-06), nrow = 2, ncol = 2, byrow = T),
                       f=t(matrix(c(100, 200), nrow = 2, ncol = 1, byrow = F)),
                       b=matrix(c(2, 5), nrow = 2, ncol = 1, byrow = F),
                       mu0=1e-4,
                       theta=0.08,
                       ystart = c(100,200), dt = 1)
  
  colnames(dat)[5:8] <- c("var1","var1.next", "var2", "var2.next")
  
  write.table(x=dat, file=paste("sim_discr_var1_var2_", format(N, scientific=FALSE), "_", i, ".csv", sep=""),row.names = FALSE, quote = FALSE) 
  cat("discr simulation, var1, var2, Num:", i, "\n")
}