library(openxlsx)

#setwd("/Volumes/G/spm_sim/")
setwd("C:\\spm_sim\\")

# Results: means, sds & confidence intervals, publication-ready tables.
true.pars <- c(-0.05, 80, 1e-06, 80, 5, 1e-5, 0.1)


#Discrete model
res.table.discr <- read.table("res.table.discr.csv", header=TRUE)

means <- c(mean(res.table.discr$a, na.rm=TRUE),
          mean(res.table.discr$f1, na.rm=TRUE),
          mean(res.table.discr$Q, na.rm=TRUE),
          mean(res.table.discr$f, na.rm=TRUE),
          mean(res.table.discr$b, na.rm=TRUE),
          mean(res.table.discr$mu0, na.rm=TRUE),
          mean(res.table.discr$theta, na.rm=TRUE))

sds <- c(sd(res.table.discr$a, na.rm=TRUE),
        sd(res.table.discr$f1, na.rm=TRUE),
        sd(res.table.discr$Q, na.rm=TRUE),
        sd(res.table.discr$f, na.rm=TRUE),
        sd(res.table.discr$b, na.rm=TRUE),
        sd(res.table.discr$mu0, na.rm=TRUE),
        sd(res.table.discr$theta, na.rm=TRUE))

#lw <- unlist(lapply(1:7, function(n) {ifelse(means[n] > 0, means[n] - 1.96*sds[n]/sqrt(100), means[n] + 1.96*sds[n]/sqrt(100))}))
#up <- unlist(lapply(1:7, function(n) {ifelse(means[n] > 0, means[n] + 1.96*sds[n]/sqrt(100), means[n] - 1.96*sds[n]/sqrt(100))}))

lw <- unlist(lapply(1:7, function(n) {quantile(res.table.discr[,n], c(.05))}))
up <- unlist(lapply(1:7, function(n) {quantile(res.table.discr[,n], c(.95))}))


res.d <- cbind(true.pars, means, sds, lw, up)
rownames(res.d) <- c("a", "f1", "Q", "f", "b", "mu0", "theta")
colnames(res.d) <- c("True", "Est.mean", "SD", "LW", "UP")
print(res.d, digits = 5)
write.xlsx(file="res.d.xlsx",x=format(res.d,digits = 5), row.names=TRUE)


# Continuous model

true.pars <- c(-0.1, 80, 1e-06, 80, 1, 1e-5, 0.08)
res.table.cont <- read.table("res.table.cont.csv", header=TRUE)

means <- c(mean(res.table.cont$a, na.rm=TRUE),
           mean(res.table.cont$f1, na.rm=TRUE),
           mean(res.table.cont$Q, na.rm=TRUE),
           mean(res.table.cont$f, na.rm=TRUE),
           mean(res.table.cont$b, na.rm=TRUE),
           mean(res.table.cont$mu0, na.rm=TRUE),
           mean(res.table.cont$theta, na.rm=TRUE))

sds <- c(sd(res.table.cont$a, na.rm=TRUE),
         sd(res.table.cont$f1, na.rm=TRUE),
         sd(res.table.cont$Q, na.rm=TRUE),
         sd(res.table.cont$f, na.rm=TRUE),
         sd(res.table.cont$b, na.rm=TRUE),
         sd(res.table.cont$mu0, na.rm=TRUE),
         sd(res.table.cont$theta, na.rm=TRUE))

lw <- unlist(lapply(1:7, function(n) {quantile(res.table.cont[,n], c(.05))}))
up <- unlist(lapply(1:7, function(n) {quantile(res.table.cont[,n], c(.95))}))

#lw <- unlist(lapply(1:7, function(n) {ifelse(means[n] > 0, quantile(res.table.cont[,n], c(.05)), quantile(res.table.cont[,n], c(.95)))}))
#up <- unlist(lapply(1:7, function(n) {ifelse(means[n] > 0, quantile(res.table.cont[,n], c(.95)), quantile(res.table.cont[,n], c(.05)))}))


res.c <- cbind(true.pars, means, sds, lw, up)
rownames(res.c) <- c("a", "f1", "Q", "f", "b", "mu0", "theta")
colnames(res.c) <- c("True", "Est.mean", "SD", "LW", "UP")
print(res.c, digits = 5)
write.xlsx(file="res.c.xlsx",x=format(res.c,digits = 5), row.names=TRUE)
