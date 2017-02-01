library(openxlsx)

#setwd("/Volumes/G/spm_sim_time-dep/")
setwd("C:\\spm_sim_time-dep\\")

true.pars <- c(-0.05, 80, 0.1 , 1e-05, 80, 2.5, 1e-1)

# Time-dependent model
res.table.time.dep <- read.table("res.table.time-dep.csv", header=TRUE)

means <- c(mean(res.table.time.dep$a, na.rm=TRUE),
          mean(res.table.time.dep$f1a, na.rm=TRUE),
          mean(res.table.time.dep$f1b, na.rm=TRUE),
          mean(res.table.time.dep$Q, na.rm=TRUE),
          mean(res.table.time.dep$f, na.rm=TRUE),
          mean(res.table.time.dep$b, na.rm=TRUE),
          mean(res.table.time.dep$mu0, na.rm=TRUE))

sds <- c(sd(res.table.time.dep$a, na.rm=TRUE),
        sd(res.table.time.dep$f1a, na.rm=TRUE),
        sd(res.table.time.dep$f1b, na.rm=TRUE),
        sd(res.table.time.dep$Q, na.rm=TRUE),
        sd(res.table.time.dep$f, na.rm=TRUE),
        sd(res.table.time.dep$b, na.rm=TRUE),
        sd(res.table.time.dep$mu0, na.rm=TRUE))

lw <- unlist(lapply(1:7, function(n) {quantile(res.table.time.dep[,n], c(.05))}))
up <- unlist(lapply(1:7, function(n) {quantile(res.table.time.dep[,n], c(.95))}))


res.t.d <- cbind(true.pars, means, sds, lw, up)
rownames(res.t.d) <- c("a", "f1a", "f1b", "Q", "f", "b", "mu0")
colnames(res.t.d) <- c("True", "Est.mean", "SD", "LW", "UP")
print(res.t.d, digits = 5)
write.xlsx(file="res.t.d.xlsx",x=format(res.t.d,digits = 5), row.names=TRUE)
