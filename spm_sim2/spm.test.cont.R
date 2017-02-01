#===========================2D continuous-time model==============================#
library(stpm)

#setwd("~/Projects/spm_sim2/")
#setwd("/Volumes/G/spm_sim2/")
#source("/Volumes/G/spm_sim2/spm.test.cont.R")
setwd("C:\\spm_sim2\\")

N <- 5000
nsim=100

res.table.cont <- matrix(nrow=nsim,ncol=16)
colnames(res.table.cont) <- c("a11", "a12", "a21", "a22", "f1_1", "f1_2", 
                              "Q11", "Q12", "Q21", "Q22", "f_1", "f_2", 
                              "b_1", "b_2", "mu0", "theta")

for(i in 1:nsim) {
  dataset <- paste("sim_cont_var1_var2_", N, "_", i, ".csv", sep='')
  cat("dataset:", dataset)
  
  d <- read.table(dataset, header = TRUE)
  
  a.d <- matrix(c(-0.1+runif(1,-1e-2,1e-2),  0.001+runif(1,-1e-4,1e-4), 0.001+runif(1,-1e-4,1e-4), -0.1+runif(1,-1e-2,1e-2)), nrow = 2, ncol = 2, byrow = T)
  f1.d <- t(matrix(c(100+runif(1,-5,5), 200+runif(1,-5,5)), nrow = 2, ncol = 1, byrow = F))
  Q.d <- matrix(c(1e-06+runif(1,-1e-7,1e-7), 1e-7+runif(1,-1e-8,1e-8), 1e-7+runif(1,-1e-8,1e-8),  1e-06+runif(1,-1e-7,1e-7)), nrow = 2, ncol = 2, byrow = T)
  f.d <- t(matrix(c(100+runif(1,-5,5), 200+runif(1,-5,5)), nrow = 2, ncol = 1, byrow = F))
  b.d <- matrix(c(1, 2), nrow = 2, ncol = 1, byrow = F)
  mu0.d <- 1e-4 + runif(1,-1e-5,1e-5)
  theta.d <- 0.08+ runif(1,-1e-4,1e-4)

  
  ans <- spm_continuous(dat=as.matrix(d[,2:dim(d)[2]]),
                        a = a.d, 
                        f1 = f1.d,
                        Q = Q.d,
                        f = f.d,
                        b = b.d,
                        mu0 = mu0.d,
                        theta = theta.d,
                        k=2, verbose = F, maxeval=150,
                        lb=c(-0.12, ifelse(a.d[2,1] > 0, a.d[2,1]-0.1*a.d[2,1], a.d[2,1]+0.1*a.d[2,1]), ifelse(a.d[1,2] > 0, a.d[1,2]-0.1*a.d[1,2], a.d[1,2]+0.1*a.d[1,2]), -0.12,  
                             95, 195, 
                             Q.d[1,1]-0.1*Q.d[1,1], ifelse(Q.d[2,1] > 0, Q.d[2,1]-0.1*Q.d[2,1], Q.d[2,1]+0.1*Q.d[2,1]), ifelse(Q.d[1,2] > 0, Q.d[1,2]-0.1*Q.d[1,2], Q.d[1,2]+0.1*Q.d[1,2]), Q.d[2,2]-0.1*Q.d[2,2],
                             95, 195,
                             0.5, 1.5,
                             0.8e-4,
                             0.06),
                        ub=c(-0.08,  0.002,  0.002, -0.08,  
                             110, 220, 
                             Q.d[1,1]+0.1*Q.d[1,1], ifelse(Q.d[2,1] > 0, Q.d[2,1]+0.1*Q.d[2,1], Q.d[2,1]-0.1*Q.d[2,1]), ifelse(Q.d[1,2] > 0, Q.d[1,2]+0.1*Q.d[1,2], Q.d[1,2]-0.1*Q.d[1,2]), Q.d[2,2]+0.1*Q.d[2,2],
                             110, 220,
                             1.5, 2.5,
                             1.2e-4,
                             0.10), algorithm = "NLOPT_LN_NELDERMEAD", pinv.tol=1e-3) #NLOPT_LN_COBYLA NLOPT_LN_NELDERMEAD NLOPT_GN_CRS2_LM
  
  
  res.table.cont[i,1] <- ans$a[1,1]
  res.table.cont[i,2] <- ans$a[1,2]
  res.table.cont[i,3] <- ans$a[2,1]
  res.table.cont[i,4] <- ans$a[2,2]
  res.table.cont[i,5] <- ans$f1[1,1]
  res.table.cont[i,6] <- ans$f1[2,1]
  res.table.cont[i,7] <- ans$Q[1,1]
  res.table.cont[i,8] <- ans$Q[1,2]
  res.table.cont[i,9] <- ans$Q[2,1]
  res.table.cont[i,10] <- ans$Q[2,2]
  res.table.cont[i,11] <- ans$f[1,1]
  res.table.cont[i,12] <- ans$f[2,1]
  res.table.cont[i,13] <- ans$b[1,1]
  res.table.cont[i,14] <- ans$b[2,1]
  res.table.cont[i,15] <- ans$mu0
  res.table.cont[i,16] <- ans$theta
  print(res.table.cont[i,])
}


write.table(x = res.table.cont, file="res.table.cont.csv", row.names=FALSE)