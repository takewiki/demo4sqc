library(rJava)
library(Rwordseg)

#测试rJava 和Rwordseg是否安装好
teststring1 <- "我爱R语言，我爱文本挖掘"
segmentCN(teststring1)