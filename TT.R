tab <- read.table("file:///Users/jules/Documents/huitres.txt",header=T)
str(tab)
tab$bassin=as.factor(tab$bassin)
