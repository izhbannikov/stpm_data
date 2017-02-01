setwd("C:\\spm_sim_time-dep\\")

true.pars <- c(-0.05, 80, 0.1, 1e-05, 80, 2.5, 1e-1)

# Time-dependent model
res.table.time.dep <- read.table("res.table.time-dep.csv", header=TRUE)

# Histograms:
pdf(file = "time-dep.hists.pdf")
par(mfrow=c(2,4))
hist(res.table.time.dep[,1], main="'a'", xlab="value", col="green")
abline(v=mean(res.table.time.dep[,1]), col="red", lwd=2)
abline(v=true.pars[1], col="blue", lwd=2)

hist(res.table.time.dep[,2], main="'f1a'", xlab="value", col="green")
abline(v=mean(res.table.time.dep[,2]), col="red", lwd=2)
abline(v=true.pars[2], col="blue", lwd=2)

hist(res.table.time.dep[,3], main="'f1b'", xlab="value", col="green")
abline(v=mean(res.table.time.dep[,3]), col="red", lwd=2)
abline(v=true.pars[3], col="blue", lwd=2)

hist(res.table.time.dep[,4], main="'Q'", xlab="value", col="green")
abline(v=mean(res.table.time.dep[,4]), col="red", lwd=2)
abline(v=true.pars[4], col="blue", lwd=2)

hist(res.table.time.dep[,5], main="'f'", xlab="value", col="green")
abline(v=mean(res.table.time.dep[,5]), col="red", lwd=2)
abline(v=true.pars[5], col="blue", lwd=2)

hist(res.table.time.dep[,6], main="'b'", xlab="value", col="green")
abline(v=mean(res.table.time.dep[,6]), col="red", lwd=2)
abline(v=true.pars[6], col="blue", lwd=2)

hist(res.table.time.dep[,7], main="'mu0'", xlab="value", col="green")
abline(v=mean(res.table.time.dep[,7]), col="red", lwd=2)
abline(v=true.pars[7], col="blue", lwd=2)

dev.off()