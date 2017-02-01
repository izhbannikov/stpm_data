## Simulation tests for SPM R-package
library(stpm)

#setwd("~/Projects/spm_sim/")
setwd("/Volumes/G/spm_sim/")

# Number of individuals:
N <- 15000
# Number of simulations:
nsim <- 30
set.seed(123)

for(i in 1:nsim) {
  dat <- simdata_discr(N=N, ystart = 80, a = -0.05, Q = 1e-06, mu0 = 1e-5, theta = 0.1, f1 = 80, f=80, b=5)
  write.table(x=dat, file=paste("sim_discr_var1_", N, "_", i, ".csv", sep=""),row.names = FALSE, quote = FALSE) 
  cat("Discr. simulation, N = ", N, " var1, Num:", i, "\n")
}

