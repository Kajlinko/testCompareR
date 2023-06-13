#-------------------------------------------------------------------------------
# CALCULATING FUNCTION TIMES
#-------------------------------------------------------------------------------

# load required packages
library(microbenchmark)
library(testCompareR)
library(DTComPair)
library(ggplot2)
# manually load compbdt - available https://doi.org/10.1186/s12874-020-00988-y

# pre-processing of data for separate package
dat.compareR <- cass
dat.DTComPair <- data.frame(cass$angio, cass$exercise, cass$cp)
dat.compbdt <- testCompareR:::values.2test(cass)

# run compareR from within a function to make similar to DTComPair
test <- function(dat) {
  compareR(dat)
}

# run all functions from DTComPair to create similar readout to compareR
DTComPair <- function(dat) {
  dtc <- tab.paired(d = dat[,3], y1 = dat[,1], dat[,2], data = dat)
  acc.paired(dtc)
  sesp.mcnemar(dtc)
  pv.wgs(dtc)
  dlr.regtest(dtc)
}

# calculate times for 1) compareR 2) compareR+interpretR 3) DTComPair 4) compbdt
efficiency <- microbenchmark(
  compareR = test(dat.compareR),
  interpretR = interpretR(test(dat.compareR)),
  DTComPair = DTComPair(dat.DTComPair),
  compbdt = compbdt(dat.compbdt$s11, dat.compbdt$s10,
                    dat.compbdt$s01, dat.compbdt$s00,
                    dat.compbdt$r11, dat.compbdt$r10,
                    dat.compbdt$r01, dat.compbdt$r00),
  times = 100
)

# investigate efficiency of DTComPair
d <- as.vector(cass$angio)
y1 <- as.vector(cass$exercise)
y2 <- as.vector(cass$cp)
dtc <- tab.paired(d = d, y1 = y1, y2 = y2)

dt.efficiency <- microbenchmark(
  describe = acc.paired(dtc),
  h.acc = sesp.mcnemar(dtc),
  h.pv = pv.wgs(dtc),
  h.lr = dlr.regtest(dtc),
  times = 100
)

efficiency$expr <- factor(efficiency$expr, levels = c("compbdt", "DTComPair", "interpretR", "compareR"))

ggplot(efficiency, mapping = aes(x = time/1000000, y = expr, fill = expr)) +
  geom_violin(alpha = 0.5) +
  scale_x_log10() +
  xlab("Time (ms)") +
  ylab("") +
  theme_minimal() +
  theme(legend.position = "none", plot.margin = margin(0,0.4,0,-0.4,"cm"))
