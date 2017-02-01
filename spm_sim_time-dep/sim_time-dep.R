## Simulation tests for SPM R-package
library(stpm)

#setwd("~/Projects/spm_sim/")
#setwd("/Volumes/G/spm_sim_time-dep/")
#source('/Volumes/G/spm_sim_time-dep/sim_time-dep.R')

setwd("C:\\spm_sim_time-dep\\")

# Number of individuals:
N <- 5000
# Number of simulations:
nsim <- 100

# Covariate used:
covariate <- "var1"
# Continuous case:
for(i in 1:nsim) {
  data <- simdata_time_dep(N=N,f = list(at = "-0.05", f1t = "80+0.1*t", Qt = "1e-5", ft = "80", bt = "2.5", mu0t = "1e-1"))
  colnames(data)[5:6] <- c(covariate, paste(covariate,".next",sep=""))
  write.table(x=data, file=paste("sim_time-dep_var1_", N, "_", i, ".csv", sep=""),row.names = FALSE, quote = FALSE) 
  cat("Cont. simulation, N = ", N, " var1, Num:", i, "\n")
}




