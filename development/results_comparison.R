# comparing package results
library(testCompareR)
library(DTComPair)
# manually load compbdt

#compute results for testCompareR
results <- compareR(cass, dp=10)

# compute results for DTComPair
DTComPair <- function(dat) {

  dtc <- tab.paired(d = dat[,3], y1 = dat[,1], dat[,2])

  return(list(sum = acc.paired(dtc),
         acc = sesp.mcnemar(dtc),
         pv = pv.wgs(dtc),
         lr = dlr.regtest(dtc)))
}

results.dt <- DTComPair(cass)

# pre-process data for compbdt
dat.compbdt <- testCompareR:::values.2test(cass)

# manually run compbdt and extract numbers
compbdt(dat.compbdt$s11, dat.compbdt$s10,
        dat.compbdt$s01, dat.compbdt$s00,
        dat.compbdt$r11, dat.compbdt$r10,
        dat.compbdt$r01, dat.compbdt$r00)

# test 1
test1.acc <- matrix(rep(0, 30), ncol = 10)

test1.acc[1,1] <- results$acc$accuracies[[1]][1,1]
test1.acc[1,2] <- results$acc$accuracies[[1]][1,2]
test1.acc[1,3] <- results$acc$accuracies[[1]][1,3]
test1.acc[1,4] <- results$acc$accuracies[[1]][1,4]
test1.acc[1,5] <- results$acc$sens.p.value

test1.acc[1,6] <- results$acc$accuracies[[1]][2,1]
test1.acc[1,7] <- results$acc$accuracies[[1]][2,2]
test1.acc[1,8] <- results$acc$accuracies[[1]][2,3]
test1.acc[1,9] <- results$acc$accuracies[[1]][2,4]
test1.acc[1,10] <- results$acc$spec.p.value

test1.acc[2,1] <- results.dt$sum$Test1$sensitivity[1]*100
test1.acc[2,2] <- results.dt$sum$Test1$sensitivity[2]*100
test1.acc[2,3] <- results.dt$sum$Test1$sensitivity[3]*100
test1.acc[2,4] <- results.dt$sum$Test1$sensitivity[4]*100
test1.acc[2,5] <- results.dt$acc$sensitivity$p.value

test1.acc[2,6] <- results.dt$sum$Test1$specificity[1]*100
test1.acc[2,7] <- results.dt$sum$Test1$specificity[2]*100
test1.acc[2,8] <- results.dt$sum$Test1$specificity[3]*100
test1.acc[2,9] <- results.dt$sum$Test1$specificity[4]*100
test1.acc[2,10] <- results.dt$acc$specificity$p.value

test1.acc[3,1] <- 82.566
test1.acc[3,2] <- 1.539
test1.acc[3,3] <- 79.363
test1.acc[3,4] <- 85.389
test1.acc[3,5] <- 0

test1.acc[3,6] <- 74.144
test1.acc[3,7] <- 2.7
test1.acc[3,8] <- 68.577
test1.acc[3,9] <- 79.087
test1.acc[3,10] <- 0.991

test1.acc <- round(test1.acc, 3)
dimnames(test1.acc) <- list(c("testCompareR", "DTComPair", "compbdt"),
                            c("Se","SE","LCI","UCI","p","Sp","SE","LCI","UCI","p")
)

# test 2
test2.acc <- matrix(rep(0, 30), ncol = 10)

test2.acc[1,1] <- results$acc$accuracies[[2]][1,1]
test2.acc[1,2] <- results$acc$accuracies[[2]][1,2]
test2.acc[1,3] <- results$acc$accuracies[[2]][1,3]
test2.acc[1,4] <- results$acc$accuracies[[2]][1,4]
test2.acc[1,5] <- NA

test2.acc[1,6] <- results$acc$accuracies[[2]][2,1]
test2.acc[1,7] <- results$acc$accuracies[[2]][2,2]
test2.acc[1,8] <- results$acc$accuracies[[2]][2,3]
test2.acc[1,9] <- results$acc$accuracies[[2]][2,4]
test2.acc[1,10] <- NA

test2.acc[2,1] <- results.dt$sum$Test2$sensitivity[1]*100
test2.acc[2,2] <- results.dt$sum$Test2$sensitivity[2]*100
test2.acc[2,3] <- results.dt$sum$Test2$sensitivity[3]*100
test2.acc[2,4] <- results.dt$sum$Test2$sensitivity[4]*100
test2.acc[2,5] <- NA

test2.acc[2,6] <- results.dt$sum$Test2$specificity[1]*100
test2.acc[2,7] <- results.dt$sum$Test2$specificity[2]*100
test2.acc[2,8] <- results.dt$sum$Test2$specificity[3]*100
test2.acc[2,9] <- results.dt$sum$Test2$specificity[4]*100
test2.acc[2,10] <- NA

test2.acc[3,1] <- 91.118
test2.acc[3,2] <- 1.154
test2.acc[3,3] <- 88.610
test2.acc[3,4] <- 93.148
test2.acc[3,5] <- NA

test2.acc[3,6] <- 74.905
test2.acc[3,7] <- 2.673
test2.acc[3,8] <- 69.358
test2.acc[3,9] <- 79.787
test2.acc[3,10] <- NA

test2.acc <- round(test2.acc, 3)
dimnames(test2.acc) <- list(c("testCompareR", "DTComPair", "compbdt"),
                            c("Se","SE","LCI","UCI","p","Sp","SE","LCI","UCI","p")
)

# test 1
test1.pv <- matrix(rep(0, 30), ncol = 10)

test1.pv[1,1] <- results$pv$predictive.values[[1]][1,1]
test1.pv[1,2] <- results$pv$predictive.values[[1]][1,2]
test1.pv[1,3] <- results$pv$predictive.values[[1]][1,3]
test1.pv[1,4] <- results$pv$predictive.values[[1]][1,4]
test1.pv[1,5] <- results$pv$ppv.p.value

test1.pv[1,6] <- results$pv$predictive.values[[1]][2,1]
test1.pv[1,7] <- results$pv$predictive.values[[1]][2,2]
test1.pv[1,8] <- results$pv$predictive.values[[1]][2,3]
test1.pv[1,9] <- results$pv$predictive.values[[1]][2,4]
test1.pv[1,10] <- results$pv$npv.p.value

test1.pv[2,1] <- results.dt$sum$Test1$ppv[1]*100
test1.pv[2,2] <- results.dt$sum$Test1$ppv[2]*100
test1.pv[2,3] <- results.dt$sum$Test1$ppv[3]*100
test1.pv[2,4] <- results.dt$sum$Test1$ppv[4]*100
test1.pv[2,5] <- results.dt$pv$ppv$p.value

test1.pv[2,6] <- results.dt$sum$Test1$npv[1]*100
test1.pv[2,7] <- results.dt$sum$Test1$npv[2]*100
test1.pv[2,8] <- results.dt$sum$Test1$npv[3]*100
test1.pv[2,9] <- results.dt$sum$Test1$npv[4]*100
test1.pv[2,10] <- results.dt$pv$npv$p.value

test1.pv[3,1] <- 88.07
test1.pv[3,2] <- 1.358
test1.pv[3,3] <- 85.17
test1.pv[3,4] <- 90.498
test1.pv[3,5] <- 0.369

test1.pv[3,6] <- 64.784
test1.pv[3,7] <- 2.753
test1.pv[3,8] <- 59.246
test1.pv[3,9] <- 69.976
test1.pv[3,10] <- 0

test1.pv <- round(test1.pv, 3)
dimnames(test1.pv) <- list(c("testCompareR", "DTComPair", "compbdt"),
                            c("PPV","SE","LCI","UCI","p","NPV","SE","LCI","UCI","p")
)

# test 2
test2.pv <- matrix(rep(0, 30), ncol = 10)

test2.pv[1,1] <- results$pv$predictive.values[[2]][1,1]
test2.pv[1,2] <- results$pv$predictive.values[[2]][1,2]
test2.pv[1,3] <- results$pv$predictive.values[[2]][1,3]
test2.pv[1,4] <- results$pv$predictive.values[[2]][1,4]
test2.pv[1,5] <- NA

test2.pv[1,6] <- results$pv$predictive.values[[2]][2,1]
test2.pv[1,7] <- results$pv$predictive.values[[2]][2,2]
test2.pv[1,8] <- results$pv$predictive.values[[2]][2,3]
test2.pv[1,9] <- results$pv$predictive.values[[2]][2,4]
test2.pv[1,10] <- NA

test2.pv[2,1] <- results.dt$sum$Test2$ppv[1]*100
test2.pv[2,2] <- results.dt$sum$Test2$ppv[2]*100
test2.pv[2,3] <- results.dt$sum$Test2$ppv[3]*100
test2.pv[2,4] <- results.dt$sum$Test2$ppv[4]*100
test2.pv[2,5] <- NA

test2.pv[2,6] <- results.dt$sum$Test2$npv[1]*100
test2.pv[2,7] <- results.dt$sum$Test2$npv[2]*100
test2.pv[2,8] <- results.dt$sum$Test2$npv[3]*100
test2.pv[2,9] <- results.dt$sum$Test2$npv[4]*100
test2.pv[2,10] <- NA

test2.pv[3,1] <- 89.355
test2.pv[3,2] <- 1.239
test2.pv[3,3] <- 86.698
test2.pv[3,4] <- 91.562
test2.pv[3,5] <- NA

test2.pv[3,6] <- 78.468
test2.pv[3,7] <- 2.594
test2.pv[3,8] <- 73.024
test2.pv[3,9] <- 83.151
test2.pv[3,10] <- NA

test2.pv <- round(test2.pv, 3)
dimnames(test2.pv) <- list(c("testCompareR", "DTComPair", "compbdt"),
                           c("PPV","SE","LCI","UCI","p","NPV","SE","LCI","UCI","p")
)

# test 1
test1.lr <- matrix(rep(0, 30), ncol = 10)

test1.lr[1,1] <- results$lr$likelihood.ratios[[1]][1,1]
test1.lr[1,2] <- results$lr$likelihood.ratios[[1]][1,2]
test1.lr[1,3] <- results$lr$likelihood.ratios[[1]][1,3]
test1.lr[1,4] <- results$lr$likelihood.ratios[[1]][1,4]
test1.lr[1,5] <- results$lr$plr.p.value

test1.lr[1,6] <- results$lr$likelihood.ratios[[1]][2,1]
test1.lr[1,7] <- results$lr$likelihood.ratios[[1]][2,2]
test1.lr[1,8] <- results$lr$likelihood.ratios[[1]][2,3]
test1.lr[1,9] <- results$lr$likelihood.ratios[[1]][2,4]
test1.lr[1,10] <- results$lr$nlr.p.value

test1.lr[2,1] <- results.dt$sum$Test1$pdlr[1]
test1.lr[2,2] <- results.dt$sum$Test1$pdlr[2]
test1.lr[2,3] <- results.dt$sum$Test1$pdlr[3]
test1.lr[2,4] <- results.dt$sum$Test1$pdlr[4]
test1.lr[2,5] <- results.dt$lr$pdlr$p.value

test1.lr[2,6] <- results.dt$sum$Test1$ndlr[1]
test1.lr[2,7] <- results.dt$sum$Test1$ndlr[2]
test1.lr[2,8] <- results.dt$sum$Test1$ndlr[3]
test1.lr[2,9] <- results.dt$sum$Test1$ndlr[4]
test1.lr[2,10] <- results.dt$lr$ndlr$p.value

test1.lr[3,1] <- 3.193
test1.lr[3,2] <- 0.339
test1.lr[3,3] <- 2.61
test1.lr[3,4] <- 3.952
test1.lr[3,5] <- 0.369

test1.lr[3,6] <- 0.235
test1.lr[3,7] <- 0.023
test1.lr[3,8] <- 0.195
test1.lr[3,9] <- 0.283
test1.lr[3,10] <- 0

test1.lr <- round(test1.lr, 3)
dimnames(test1.lr) <- list(c("testCompareR", "DTComPair", "compbdt"),
                           c("PLR","SE","LCI","UCI","p","NLR","SE","LCI","UCI","p")
)

# test 2
test2.lr <- matrix(rep(0, 30), ncol = 10)

test2.lr[1,1] <- results$lr$likelihood.ratios[[2]][1,1]
test2.lr[1,2] <- results$lr$likelihood.ratios[[2]][1,2]
test2.lr[1,3] <- results$lr$likelihood.ratios[[2]][1,3]
test2.lr[1,4] <- results$lr$likelihood.ratios[[2]][1,4]
test2.lr[1,5] <- NA

test2.lr[1,6] <- results$lr$likelihood.ratios[[2]][2,1]
test2.lr[1,7] <- results$lr$likelihood.ratios[[2]][2,2]
test2.lr[1,8] <- results$lr$likelihood.ratios[[2]][2,3]
test2.lr[1,9] <- results$lr$likelihood.ratios[[2]][2,4]
test2.lr[1,10] <- NA

test2.lr[2,1] <- results.dt$sum$Test2$pdlr[1]
test2.lr[2,2] <- results.dt$sum$Test2$pdlr[2]
test2.lr[2,3] <- results.dt$sum$Test2$pdlr[3]
test2.lr[2,4] <- results.dt$sum$Test2$pdlr[4]
test2.lr[2,5] <- NA

test2.lr[2,6] <- results.dt$sum$Test2$ndlr[1]
test2.lr[2,7] <- results.dt$sum$Test2$ndlr[2]
test2.lr[2,8] <- results.dt$sum$Test2$ndlr[3]
test2.lr[2,9] <- results.dt$sum$Test2$ndlr[4]
test2.lr[2,10] <- NA

test2.lr[3,1] <- 3.631
test2.lr[3,2] <- 0.390
test2.lr[3,3] <- 2.962
test2.lr[3,4] <- 4.505
test2.lr[3,5] <- NA

test2.lr[3,6] <- 0.119
test2.lr[3,7] <- 0.016
test2.lr[3,8] <- 0.09
test2.lr[3,9] <- 0.153
test2.lr[3,10] <- NA

test2.lr <- round(test2.lr, 3)
dimnames(test2.lr) <- list(c("testCompareR", "DTComPair", "compbdt"),
                           c("PLR","SE","LCI","UCI","p","NLR","SE","LCI","UCI","p")
)

output <- list(`Acc: Exercise Stress Test` = round(test1.acc, 2),
               `Acc: History of Chest Pain` = round(test2.acc, 2),
               `PV: Exercise Stress Test` = round(test1.pv, 2),
               `PV: History of Chest Pain` = round(test2.pv, 2),
               `LR: Exercise Stress Test` = round(test1.lr, 2),
               `LR: History of Chest Pain` = round(test2.lr, 2))

save(output, file = "./development/cvomparison.rda")
