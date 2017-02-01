library(openxlsx)

#setwd("/Users/ilya/Projects/spm_sim2/")

setwd("/Volumes/G/spm_sim2/")

# Results: means, sds & confidence intervals, publication-ready tables.
true.pars <- c(-0.05,  0.001, 0.001, -0.05, 100, 200, 1e-07, 1e-8, 1e-8,  1e-07, 100, 200, 2, 5, 1e-5, 0.1)

#Discrete model
res.table.discr <- read.table("res.table.discr.csv", header=TRUE)

means <- c(mean(res.table.discr$a11, na.rm=TRUE),
          mean(res.table.discr$a12, na.rm=TRUE),
          mean(res.table.discr$a21, na.rm=TRUE),
          mean(res.table.discr$a22, na.rm=TRUE),
          mean(res.table.discr$f1_1, na.rm=TRUE),
          mean(res.table.discr$f1_2, na.rm=TRUE),
          mean(res.table.discr$Q11, na.rm=TRUE),
          mean(res.table.discr$Q12, na.rm=TRUE),
          mean(res.table.discr$Q21, na.rm=TRUE),
          mean(res.table.discr$Q22, na.rm=TRUE),
          mean(res.table.discr$f_1, na.rm=TRUE),
          mean(res.table.discr$f_2, na.rm=TRUE),
          mean(res.table.discr$b_1, na.rm=TRUE),
          mean(res.table.discr$b_2, na.rm=TRUE),
          mean(res.table.discr$mu0, na.rm=TRUE),
          mean(res.table.discr$theta, na.rm=TRUE))

sds <- c(sd(res.table.discr$a11, na.rm=TRUE),
        sd(res.table.discr$a12, na.rm=TRUE),
        sd(res.table.discr$a21, na.rm=TRUE),
        sd(res.table.discr$a22, na.rm=TRUE),
        sd(res.table.discr$f1_1, na.rm=TRUE),
        sd(res.table.discr$f1_2, na.rm=TRUE),
        sd(res.table.discr$Q11, na.rm=TRUE),
        sd(res.table.discr$Q12, na.rm=TRUE),
        sd(res.table.discr$Q21, na.rm=TRUE),
        sd(res.table.discr$Q22, na.rm=TRUE),
        sd(res.table.discr$f_1, na.rm=TRUE),
        sd(res.table.discr$f_2, na.rm=TRUE),
        sd(res.table.discr$b_1, na.rm=TRUE),
        sd(res.table.discr$b_2, na.rm=TRUE),
        sd(res.table.discr$mu0, na.rm=TRUE),
        sd(res.table.discr$theta, na.rm=TRUE))

lw <- unlist(lapply(1:16, function(n) {ifelse(means[n] > 0, quantile(res.table.discr[,n], c(.05)), quantile(res.table.discr[,n], c(.95)))}))
up <- unlist(lapply(1:16, function(n) {ifelse(means[n] > 0, quantile(res.table.discr[,n], c(.95)), quantile(res.table.discr[,n], c(.05)))}))

res.d <- cbind(true.pars, means, sds, lw, up)
rownames(res.d) <- c("a11", "a12", "a21", "a22", "f1_1", "f1_2", "Q11", "Q12", "Q21", "Q22", "f_1", "f_2", "b_1", "b_2", "mu0", "theta")
colnames(res.d) <- c("True", "Est.mean", "SD", "LW", "UP")
print(res.d, digits = 5)
write.xlsx(file="res.d.xlsx",x=format(res.d,digits = 5), row.names = TRUE)


# Continuous model

# Results: means, sds & confidence intervals, publication-ready tables.
true.pars <- c(-0.1,  0.001, 0.001, -0.1, 100, 200, 1e-06, 1e-7, 1e-7,  1e-06, 100, 200, 1, 2, 1e-4, 0.08)

res.table.cont <- read.table("res.table.cont.csv", header=TRUE)

means <- c(mean(res.table.cont$a11, na.rm=TRUE),
           mean(res.table.cont$a12, na.rm=TRUE),
           mean(res.table.cont$a21, na.rm=TRUE),
           mean(res.table.cont$a22, na.rm=TRUE),
           mean(res.table.cont$f1_1, na.rm=TRUE),
           mean(res.table.cont$f1_2, na.rm=TRUE),
           mean(res.table.cont$Q11, na.rm=TRUE),
           mean(res.table.cont$Q12, na.rm=TRUE),
           mean(res.table.cont$Q21, na.rm=TRUE),
           mean(res.table.cont$Q22, na.rm=TRUE),
           mean(res.table.cont$f_1, na.rm=TRUE),
           mean(res.table.cont$f_2, na.rm=TRUE),
           mean(res.table.cont$b_1, na.rm=TRUE),
           mean(res.table.cont$b_2, na.rm=TRUE),
           mean(res.table.cont$mu0, na.rm=TRUE),
           mean(res.table.cont$theta, na.rm=TRUE))

sds <- c(sd(res.table.cont$a11, na.rm=TRUE),
         sd(res.table.cont$a12, na.rm=TRUE),
         sd(res.table.cont$a21, na.rm=TRUE),
         sd(res.table.cont$a22, na.rm=TRUE),
         sd(res.table.cont$f1_1, na.rm=TRUE),
         sd(res.table.cont$f1_2, na.rm=TRUE),
         sd(res.table.cont$Q11, na.rm=TRUE),
         sd(res.table.cont$Q12, na.rm=TRUE),
         sd(res.table.cont$Q21, na.rm=TRUE),
         sd(res.table.cont$Q22, na.rm=TRUE),
         sd(res.table.cont$f_1, na.rm=TRUE),
         sd(res.table.cont$f_2, na.rm=TRUE),
         sd(res.table.cont$b_1, na.rm=TRUE),
         sd(res.table.cont$b_2, na.rm=TRUE),
         sd(res.table.cont$mu0, na.rm=TRUE),
         sd(res.table.cont$theta, na.rm=TRUE))

#lw <- unlist(lapply(1:16, function(n) {ifelse(means[n] > 0, means[n] - 1.96*sds[n]/sqrt(100), means[n] + 1.96*sds[n]/sqrt(100))}))
#up <- unlist(lapply(1:16, function(n) {ifelse(means[n] > 0, means[n] + 1.96*sds[n]/sqrt(100), means[n] - 1.96*sds[n]/sqrt(100))}))

#lw <- unlist(lapply(1:16, function(n) {ifelse(means[n] > 0, means[n] - 1.96*sds[n]/sqrt(30), means[n] + 1.96*sds[n]/sqrt(30))}))
#up <- unlist(lapply(1:16, function(n) {ifelse(means[n] > 0, means[n] + 1.96*sds[n]/sqrt(30), means[n] - 1.96*sds[n]/sqrt(30))}))


lw <- unlist(lapply(1:16, function(n) {ifelse(means[n] > 0, quantile(res.table.cont[,n], c(.05)), quantile(res.table.cont[,n], c(.95)))}))
up <- unlist(lapply(1:16, function(n) {ifelse(means[n] > 0, quantile(res.table.cont[,n], c(.95)), quantile(res.table.cont[,n], c(.05)))}))


res.c <- cbind(true.pars, means, sds, lw, up)
rownames(res.c) <- c("a11", "a12", "a21", "a22", "f1_1", "f1_2", "Q11", "Q12", "Q21", "Q22", "f_1", "f_2", "b_1", "b_2", "mu0", "theta")
colnames(res.c) <- c("True", "Est.mean", "SD", "LW", "UP")
print(res.c, digits = 5)
write.xlsx(file="res.c.xlsx",x=format(res.c,digits = 5), row.names = TRUE)
