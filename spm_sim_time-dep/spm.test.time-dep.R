# SPM statistical tests:
library(stpm)

#setwd("/Volumes/G/spm_sim_time-dep/")
#source("/Volumes/G/spm_sim_time-dep/spm.test.time-dep.R")
setwd("C:\\spm_sim_time-dep\\")

N <- 5000
nsim <- 100

# Continuous case:
## var1
res.table.cont <- matrix(nrow=nsim,ncol=7)
colnames(res.table.cont) <- c("a", "f1a", "f1b", "Q", "f", "b", "mu0")

for(i in 1:nsim) {
  a.s <- runif(1, -0.065, -0.035) # -0.05
  f1a.s <- runif(1, 75, 85) # 80
  f1b.s <- runif(1, 0.09, 0.11) # 80
  Q.s <- runif(1, 0.9e-5, 1.1e-5) # 1e-5
  f.s <- runif(1, 75, 85) # 80
  b.s <- runif(1, 2.25, 2.75) # 2.5
  mu0.s <- runif(1, 0.9e-1, 1.1e-1) # 1e-1
  
  d <- read.csv(paste("sim_time-dep_var1_", N, "_", i, ".csv", sep=""), header = TRUE, sep=" ")
  ans<-spm_time_dep(d,f = list(at = "a", f1t = "f1a+f1b*t", Qt = "Q", ft = "f", bt = "b", mu0t = "mu0"),
                    start=list(a=a.s,f1a=f1a.s, f1b=f1b.s, Q=Q.s,f=f.s,b=b.s,mu0=mu0.s), algorithm="NLOPT_LN_NELDERMEAD", maxeval=200, #NLOPT_LN_COBYLA NLOPT_LN_NELDERMEAD
                   lb = c(-0.07, 70, 0.07, 0.1e-5, 10, 2, 0.8e-1), ub=c(-0.03, 110, 0.13, 1.9e-5, 150, 3, 1.2e-1), verbose = FALSE)
  
  print(paste("Iteration:",i))
  res.table.cont[i,1] <- ans[[1]]$a
  res.table.cont[i,2] <- ans[[1]]$f1a
  res.table.cont[i,3] <- ans[[1]]$f1b
  res.table.cont[i,4] <- ans[[1]]$Q
  res.table.cont[i,5] <- ans[[1]]$f
  res.table.cont[i,6] <- ans[[1]]$b
  res.table.cont[i,7] <- ans[[1]]$mu0
  print(res.table.cont[i,])
}

write.table(x = res.table.cont, file="res.table.time-dep.csv", row.names=FALSE)