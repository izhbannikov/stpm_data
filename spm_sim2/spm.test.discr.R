#===========================2D simulation==============================#
library(stpm)

setwd("C:\\spm_sim2")

N <- 5000
nsim=100

# Discrete case:
means <- matrix(nrow=2, ncol=16)
colnames(means) <- c("a11", "a12", "a21", "a22", "f1_1", "f1_2", 
                     "Q11", "Q12", "Q21", "Q22", "f_1", "f_2", 
                     "b_1", "b_2", "mu0", "theta")

rownames(means) <- c("d", "c")
means <- data.frame(means)

sds <- matrix(nrow=2, ncol=16)
colnames(sds) <- c("a11", "a12", "a21", "a22", "f1_1", "f1_2", 
                   "Q11", "Q12", "Q21", "Q22", "f_1", "f_2", 
                   "b_1", "b_2", "mu0", "theta")
rownames(sds) <- c("d", "c")
sds <- data.frame(sds)

res.table.discr <- data.frame(matrix(nrow=nsim,ncol=16))
colnames(res.table.discr) <- c("a11", "a12", "a21", "a22", "f1_1", "f1_2", 
                               "Q11", "Q12", "Q21", "Q22", "f_1", "f_2", 
                               "b_1", "b_2", "mu0", "theta")
## Discrete case:
#
for(i in 1:nsim) {
  
  dataset <- paste("sim_discr_var1_var2_", format(N, scientific=F), "_", i, ".csv", sep='')
  cat("dataset:", dataset)
  d <- read.table(dataset, header = TRUE)
 
  ans <- spm_discrete(dat=d, theta_range = seq(0.075,0.085, by=0.001),verbose=FALSE)
  
  res.table.discr[i,1] <- ans$Ya2007$a[1,1]
  res.table.discr[i,2] <- ans$Ya2007$a[1,2]
  res.table.discr[i,3] <- ans$Ya2007$a[2,1]
  res.table.discr[i,4] <- ans$Ya2007$a[2,2]
  res.table.discr[i,5] <- ans$Ya2007$f1[1,1]
  res.table.discr[i,6] <- ans$Ya2007$f1[1,2]
  res.table.discr[i,7] <- ans$Ya2007$Q[1,1]
  res.table.discr[i,8] <- ans$Ya2007$Q[1,2]
  res.table.discr[i,9] <- ans$Ya2007$Q[2,1]
  res.table.discr[i,10] <- ans$Ya2007$Q[2,2]
  res.table.discr[i,11] <- ans$Ya2007$f[1,1]
  res.table.discr[i,12] <- ans$Ya2007$f[1,2]
  res.table.discr[i,13] <- ans$Ya2007$b[1,1]
  res.table.discr[i,14] <- ans$Ya2007$b[2,1]
  res.table.discr[i,15] <- ans$Ya2007$mu0[1,1]
  res.table.discr[i,16] <- ans$Ya2007$theta
  print(res.table.discr[i,])
}

write.table(x = res.table.discr, file="res.table.discr2.csv", row.names=FALSE)
