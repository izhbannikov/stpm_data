# SPM statistical tests:
library(stpm)

#---------------------Discrete model---------------------#

setwd("/Volumes/G/spm_sim/")
#setwd("~/Projects/spm_sim/")

set.seed(123)

N <- 15000
nsim <- 10

# Discrete case:
res.table.discr <- matrix(nrow=nsim,ncol=7)
colnames(res.table.discr) <- c("a", "f1", "Q", "f", "b", "mu0", "theta")
# Discrete case:
for(i in 1:nsim) {
  dataset <- paste("sim_discr_var1_5000_", i, ".csv", sep='')
  cat("dataset:", dataset)
 
  d <- read.table(dataset, header = TRUE)
  ans <- spm_discrete(dat=d, k=1, verbose=FALSE, theta_range = seq(0.09, 0.11, by=0.001))
  
  res.table.discr[i,1] <- ans$pars2$a
  res.table.discr[i,2] <- ans$pars2$f1
  res.table.discr[i,3] <- ans$pars2$Q
  res.table.discr[i,4] <- ans$pars2$f
  res.table.discr[i,5] <- ans$pars2$b
  res.table.discr[i,6] <- ans$pars2$mu0
  res.table.discr[i,7] <- ans$pars2$theta
  print(res.table.discr[i,])
}

write.table(x = res.table.discr, file="res.table.discr.csv", row.names=FALSE)

