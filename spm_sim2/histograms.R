setwd("C:\\spm_sim2")

true_pars <- c(-0.05,  0.001, 0.001, -0.05, 100, 200, 1e-06, 1e-7, 1e-7,  1e-06, 100, 200, 2, 5, 1e-4, 0.08)

res.table.discr <- read.table("res.table.discr2.csv", header=TRUE)

# Histograms:
pdf(file = "discr.hists.pdf")
par(mfrow=c(4,4))

hist(res.table.discr[,1], main="'a11'", xlab="value", col="green")
abline(v=mean(res.table.discr[,1]), col="red", lwd=2)
abline(v=true_pars[1], col="blue", lwd=2)

hist(res.table.discr[,2], main="'a12'", xlab="value", col="green")
abline(v=mean(res.table.discr[,2]), col="red", lwd=2)
abline(v=true_pars[2], col="blue", lwd=2)

hist(res.table.discr[,3], main="'a21'", xlab="value", col="green")
abline(v=mean(res.table.discr[,3]), col="red", lwd=2)
abline(v=true_pars[3], col="blue", lwd=2)

hist(res.table.discr[,4], main="'a22'", xlab="value", col="green")
abline(v=mean(res.table.discr[,4]), col="red", lwd=2)
abline(v=true_pars[4], col="blue", lwd=2)


hist(res.table.discr[,5], main="'f1_1'", xlab="value", col="green")
abline(v=mean(res.table.discr[,5]), col="red", lwd=2)
abline(v=true_pars[5], col="blue", lwd=2)

hist(res.table.discr[,6], main="'f1_2'", xlab="value", col="green")
abline(v=mean(res.table.discr[,6]), col="red", lwd=2)
abline(v=true_pars[6], col="blue", lwd=2)


hist(res.table.discr[,7], main="'Q11'", xlab="value", col="green")
abline(v=mean(res.table.discr[,7]), col="red", lwd=2)
abline(v=true_pars[7], col="blue", lwd=2)

hist(res.table.discr[,8], main="'Q12'", xlab="value", col="green")
abline(v=mean(res.table.discr[,8]), col="red", lwd=2)
abline(v=true_pars[8], col="blue", lwd=2)

hist(res.table.discr[,9], main="'Q21'", xlab="value", col="green")
abline(v=mean(res.table.discr[,9]), col="red", lwd=2)
abline(v=true_pars[9], col="blue", lwd=2)

hist(res.table.discr[,10], main="'Q22'", xlab="value", col="green")
abline(v=mean(res.table.discr[,10]), col="red", lwd=2)
abline(v=true_pars[10], col="blue", lwd=2)


hist(res.table.discr[,11], main="'f_1'", xlab="value", col="green")
abline(v=mean(res.table.discr[,11]), col="red", lwd=2)
abline(v=true_pars[11], col="blue", lwd=2)

hist(res.table.discr[,12], main="'f_2'", xlab="value", col="green")
abline(v=mean(res.table.discr[,12]), col="red", lwd=2)
abline(v=true_pars[12], col="blue", lwd=2)

hist(res.table.discr[,13], main="'b1'", xlab="value", col="green")
abline(v=mean(res.table.discr[,13]), col="red", lwd=2)
abline(v=true_pars[13], col="blue", lwd=2)

hist(res.table.discr[,14], main="'b2'", xlab="value", col="green")
abline(v=mean(res.table.discr[,14]), col="red", lwd=2)
abline(v=true_pars[14], col="blue", lwd=2)

hist(res.table.discr[,15], main="'mu0'", xlab="value", col="green")
abline(v=mean(res.table.discr[,15]), col="red", lwd=2)
abline(v=true_pars[15], col="blue", lwd=2)

hist(res.table.discr[,16], main="'theta'", xlab="value", col="green")
abline(v=mean(res.table.discr[,16]), col="red", lwd=2)
abline(v=true_pars[16], col="blue", lwd=2)

dev.off()

true_pars <- c(-0.1,  0.001, 0.001, -0.1, 100, 200, 1e-06, 1e-7, 1e-7,  1e-06, 100, 200, 1, 2, 1e-4, 0.08)
res.table.cont <- read.table("res.table.cont.csv", header=TRUE)
# Histograms:
pdf(file = "cont.hists.pdf")
par(mfrow=c(4,4))

hist(res.table.cont[,1], main="'a11'", xlab="value", col="green")
abline(v=mean(res.table.cont[,1]), col="red", lwd=2)
abline(v=true_pars[1], col="blue", lwd=2)

hist(res.table.cont[,2], main="'a12'", xlab="value", col="green")
abline(v=mean(res.table.cont[,2]), col="red", lwd=2)
abline(v=true_pars[2], col="blue", lwd=2)

hist(res.table.cont[,3], main="'a21'", xlab="value", col="green")
abline(v=mean(res.table.cont[,3]), col="red", lwd=2)
abline(v=true_pars[3], col="blue", lwd=2)

hist(res.table.cont[,4], main="'a22'", xlab="value", col="green")
abline(v=mean(res.table.cont[,4]), col="red", lwd=2)
abline(v=true_pars[4], col="blue", lwd=2)


hist(res.table.cont[,5], main="'f1_1'", xlab="value", col="green")
abline(v=mean(res.table.cont[,5]), col="red", lwd=2)
abline(v=true_pars[5], col="blue", lwd=2)

hist(res.table.cont[,6], main="'f1_2'", xlab="value", col="green")
abline(v=mean(res.table.cont[,6]), col="red", lwd=2)
abline(v=true_pars[6], col="blue", lwd=2)


hist(res.table.cont[,7], main="'Q11'", xlab="value", col="green")
abline(v=mean(res.table.cont[,7]), col="red", lwd=2)
abline(v=true_pars[7], col="blue", lwd=2)

hist(res.table.cont[,8], main="'Q12'", xlab="value", col="green")
abline(v=mean(res.table.cont[,8]), col="red", lwd=2)
abline(v=true_pars[8], col="blue", lwd=2)

hist(res.table.cont[,9], main="'Q21'", xlab="value", col="green")
abline(v=mean(res.table.cont[,9]), col="red", lwd=2)
abline(v=true_pars[9], col="blue", lwd=2)

hist(res.table.cont[,10], main="'Q22'", xlab="value", col="green")
abline(v=mean(res.table.cont[,10]), col="red", lwd=2)
abline(v=true_pars[10], col="blue", lwd=2)


hist(res.table.cont[,11], main="'f_1'", xlab="value", col="green")
abline(v=mean(res.table.cont[,11]), col="red", lwd=2)
abline(v=true_pars[11], col="blue", lwd=2)

hist(res.table.cont[,12], main="'f_2'", xlab="value", col="green")
abline(v=mean(res.table.cont[,12]), col="red", lwd=2)
abline(v=true_pars[12], col="blue", lwd=2)

hist(res.table.cont[,13], main="'b1'", xlab="value", col="green")
abline(v=mean(res.table.cont[,13]), col="red", lwd=2)
abline(v=true_pars[13], col="blue", lwd=2)

hist(res.table.cont[,14], main="'b2'", xlab="value", col="green")
abline(v=mean(res.table.cont[,14]), col="red", lwd=2)
abline(v=true_pars[14], col="blue", lwd=2)

hist(res.table.cont[,15], main="'mu0'", xlab="value", col="green")
abline(v=mean(res.table.cont[,15]), col="red", lwd=2)
abline(v=true_pars[15], col="blue", lwd=2)

hist(res.table.cont[,16], main="'theta'", xlab="value", col="green")
abline(v=mean(res.table.cont[,16]), col="red", lwd=2)
abline(v=true_pars[16], col="blue", lwd=2)

dev.off()