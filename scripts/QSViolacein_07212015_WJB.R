# Quorum Sensing Violacein Analysis
# Jared Brewer
# Created: July 21, 2015
# Modified: July 23, 2015

# The end goal here is to perform an ANOVA and make a bar plot. 

qs <- read.csv("./QSViolacein_07212015_WJB.csv", header = T)
attach(qs)

qs.aov <- aov(WNP~WOP, data=qs)
summary(qs.aov)
TukeyHSD(qs.aov)
# The results aren't signficant. Not even a close.
# This Tukey pops an error as well. I don't know how to get around that.

qs.means <- c(mean(qs$WNP, na.rm=T), mean(qs$WOP, na.rm=T))
qs.std <- c(sd(qs$WNP, na.rm=T), sd(qs$WOP, na.rm=T)) 
qs.n <- c(sum(qs$WNP, na.rm=T)/mean(qs$WOP, na.rm=T), sum(qs$WOP, na.rm=T)/mean(qs$WNP, na.rm=T))
qs.se <- c(qs.std/sqrt(abs(qs.n)))

qs.bar <- barplot(qs.means, names = c("WNP", "WOP"), xlab="Treatment", ylab="Violacein Units", ylim=c(-1, 2), col=c("darkorchid4", "white"))
abline(h=0)
segments(qs.bar, qs.means+qs.se, qs.bar, qs.means-qs.se) 
# Applies vertical marks for standard error
segments(qs.bar -0.05, qs.means+qs.se, qs.bar +0.05, qs.means+qs.se) 
# Makes horizontal tick on positive SE
# Numbers determine the width of the ticks
segments(qs.bar -0.05, qs.means-qs.se, qs.bar +0.05, qs.means-qs.se) 

# It is odd that the WOP is negative, but that's an adjusting error that can be fixed with some rapidity.
# Looks smooth otherwise.