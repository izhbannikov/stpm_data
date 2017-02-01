## Simulation tests for SPM R-package
library(stpm)

#setwd("~/Projects/spm_sim/")
#setwd("/Volumes/G/spm_sim/")
setwd("C:\\spm_sim\\")

# Number of individuals:
N <- 5000
# Number of simulations:
nsim <- 100

#set.seed(123)

for(i in 1:nsim) {
  dat <- simdata_cont2(N=N, ystart = 80, a = -0.1, Q = 1e-06, mu0 = 1e-5, theta = 0.08, f1 = 80, f=80, b=1, dt=1, sd0=5)
  write.table(x=dat, file=paste("sim_cont_var1_", N, "_", i, ".csv", sep=""),row.names = FALSE, quote = FALSE) 
  cat("Cont. simulation, N = ,", N, " var1, Num:", i, "\n")
}



