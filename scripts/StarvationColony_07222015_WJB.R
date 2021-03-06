# Starvation Culture Colony Count Analysis
# Jared Brewer
# Created: July 22, 2015
# Modified: July 23, 2015

# Run a regression and make a line plot.

tencol <- read.csv("StarvationColony_TenDay_07232015_2_WJB.csv", header = T)
onecol <- read.csv("StarvationColony_OneDay_07232015_2_WJB.csv", header = T)

# Look at relative abundance and graph separately.
# Also think about doing ratios instead of absolute numbers.

plot(tencol$Day, tencol$P, col='purple')
points(tencol$Day, tencol$W, col='black')
abline(lm(Day~P, data=tencol))
abline(lm(Day~W, data=tencol))

# Run a regression and look for differences, one at a time.
tencolP.reg <- lm(Day~P, data=tencol)
summary(tencolP.reg)
# Significance! 

tencolW.reg <- lm(Day~W, data=tencol)
summary(tencolW.reg)

plot(onecol$Day, onecol$P, col='purple')
points(onecol$Day, onecol$W, col='black')
abline(lm(Day~P, data=onecol))
abline(lm(Day~W, data=onecol))

onecolP.reg <- lm(Day~P, data=onecol)
summary(onecolP.reg)

onecolW.reg <- lm(Day~W, data=onecol)
summary(onecolW.reg)

# What does it mean to fit a model to it? Will a regression give me that data? 
# How do I fit proper lines to it? And how do I get an equation from that?
# Yep, still nothing.