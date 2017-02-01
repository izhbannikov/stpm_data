#setwd("~/Projects/sim_spm/")
#setwd("/Volumes/G/spm_sim/")
setwd("C:\\spm_sim\\")

true.pars <- c(-0.05, 80, 1e-06, 80, 5, 1e-5, 0.1)

# Discrete model
res.table.discr <- read.table("res.table.discr.csv", header=TRUE)

# Histograms:
pdf(file = "discr.hists.pdf")
par(mfrow=c(2,4))
hist(res.table.discr[,1], main="'a'", xlab="value", col="green")
abline(v=mean(res.table.discr[,1]), col="red", lwd=2)
abline(v=true.pars[1], col="blue", lwd=2)

hist(res.table.discr[,2], main="'f1'", xlab="value", col="green")
abline(v=mean(res.table.discr[,2]), col="red", lwd=2)
abline(v=true.pars[2], col="blue", lwd=2)

hist(res.table.discr[,3], main="'Q'", xlab="value", col="green")
abline(v=mean(res.table.discr[,3]), col="red", lwd=2)
abline(v=true.pars[3], col="blue", lwd=2)

hist(res.table.discr[,4], main="'f'", xlab="value", col="green")
abline(v=mean(res.table.discr[,4]), col="red", lwd=2)
abline(v=true.pars[4], col="blue", lwd=2)

hist(res.table.discr[,5], main="'b'", xlab="value", col="green")
abline(v=mean(res.table.discr[,5]), col="red", lwd=2)
abline(v=true.pars[5], col="blue", lwd=2)

hist(res.table.discr[,6], main="'mu0'", xlab="value", col="green")
abline(v=mean(res.table.discr[,6]), col="red", lwd=2)
abline(v=true.pars[6], col="blue", lwd=2)

hist(res.table.discr[,7], main="'theta'", xlab="value", col="green")
abline(v=mean(res.table.discr[,7]), col="red", lwd=2)
abline(v=true.pars[7], col="blue", lwd=2)


dev.off()

# Contunuous model
true.pars <- c(-0.1, 80, 1e-06, 80, 1, 1e-5, 0.08)
res.table.cont <- read.table("res.table.cont.csv", header=TRUE)
# Histograms:
pdf(file = "cont.hists.pdf")
par(mfrow=c(2,4))
hist(res.table.cont[,1], main="'a'", xlab="value", col="green")
abline(v=mean(res.table.cont[,1]), col="red", lwd=2)
abline(v=true.pars[1], col="blue", lwd=2)

hist(res.table.cont[,2], main="'f1'", xlab="value", col="green")
abline(v=mean(res.table.cont[,2]), col="red", lwd=2)
abline(v=true.pars[2], col="blue", lwd=2)

hist(res.table.cont[,3], main="'Q'", xlab="value", col="green", breaks=20)
abline(v=mean(res.table.cont[,3]), col="red", lwd=2)
abline(v=true.pars[3], col="blue", lwd=2)

hist(res.table.cont[,4], main="'f'", xlab="value", col="green")
abline(v=mean(res.table.cont[,4]), col="red", lwd=2)
abline(v=true.pars[4], col="blue", lwd=2)

hist(res.table.cont[,5], main="'b'", xlab="value", col="green")
abline(v=mean(res.table.cont[,5]), col="red", lwd=2)
abline(v=true.pars[5], col="blue", lwd=2)

hist(res.table.cont[,6], main="'mu0'", xlab="value", col="green")
abline(v=mean(res.table.cont[,6]), col="red", lwd=2)
abline(v=true.pars[6], col="blue", lwd=2)

hist(res.table.cont[,7], main="'theta'", xlab="value", col="green")
abline(v=mean(res.table.cont[,7]), col="red", lwd=2)
abline(v=true.pars[7], col="blue", lwd=2)

dev.off()