library(stpm)

#setwd("~/Projects/spm_sim2/")
setwd("/Volumes/G/spm_sim2/")

i=1
N = 5000
dataset <- paste("sim_discr_var1_var2_", format(N, scientific=F), "_", i, ".csv", sep='')
cat("dataset:", dataset)
d <- read.table(dataset, header = TRUE)
ans <- spm_discrete(dat=d, k=2, theta_range = seq(0.075,0.085, by=0.001),verbose=FALSE)
ans