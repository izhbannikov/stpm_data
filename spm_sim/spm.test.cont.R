#-------------------------------------Continuous model-----------------------------------------#
# SPM statistical tests:
library(stpm)

#setwd("/Volumes/G/spm_sim/")
#setwd("~/Projects/spm_sim/")
setwd("C:\\spm_sim\\")

N <- 5000
nsim <- 100


res.table.cont <- matrix(nrow=nsim,ncol=7)
colnames(res.table.cont) <- c("a", "f1", "Q", "f", "b", "mu0", "theta")
res.table.cont <- data.frame(res.table.cont)

for(i in 1:nsim) {
  dataset <- paste("sim_cont_var1_", N, "_", i, ".csv", sep='')
  cat("dataset:", dataset, "\n")
  
  d <- read.table(dataset, header = TRUE)
  
  ans <- spm_continuous(dat=as.matrix(d[,2:6]),
                        a = -0.1,
                        f1 = 80+runif(1,-5,5), 
                        Q = 1.0e-6+runif(1,-1e-7,1e-7),
                        f = 80+runif(1,-5,5),
                        b = 1,
                        mu0 = 1.0e-5+runif(1,-1e-6,1e-6),
                        theta = 0.08+runif(1,-1e-3,1e-3),
                        k=1, stopifbound = FALSE, verbose=FALSE, maxeval=300,
                        lb=c(-0.12, 60, 0.6e-6, 60, 0.5, 0.6e-5, 0.06), ub=c(-0.08, 140, 1.3e-06, 140, 1.5, 1.2e-5, 0.10),
                        #lb=c(-Inf, -Inf, -Inf, -Inf, -Inf, -Inf, -Inf), ub=c(Inf, Inf, Inf, Inf, Inf, Inf, Inf),
                        algorithm="NLOPT_LN_NELDERMEAD", pinv.tol=1e-5) # "NLOPT_LN_COBYLA" "NLOPT_LN_NELDERMEAD" NLOPT_LN_NEWUOA_BOUND
  
  res.table.cont[i,1] <- ans$a
  res.table.cont[i,2] <- ans$f1
  res.table.cont[i,3] <- ans$Q
  res.table.cont[i,4] <- ans$f
  res.table.cont[i,5] <- ans$b
  res.table.cont[i,6] <- ans$mu0
  res.table.cont[i,7] <- ans$theta
  print(res.table.cont[i,])
}

write.table(x = res.table.cont, file="res.table.cont.csv", row.names=FALSE)
