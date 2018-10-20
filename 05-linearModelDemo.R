set.seed(1);
x <- seq(1,5,length.out = 100);
noise <- rnorm(100);
beta0 <- 1;
beta1 <- 2;

y <- beta0 + beta1 * x + noise;

# 作散点图显示上述数据;
plot(y~x);

# 建议一元回档模型
# 不是“两点一线”的数学关系；

lm1 <- lm(y~x);

# 提取模型的参数
beta0_lm <-lm1$coefficients[1];
beta1_lm <- lm1$coefficients[2];
# 拟合模型数据到原始数据图上；

plot(y~x);
#画线工具；
abline(lm1);

#返回置信区间
yConf <- predict(lm1,interval = "confidence");

# View(yConf);  
# matrix wiht 100 * 3; 
# 返回预测值
yPred <- predict(lm1,interval = "prediction");

# yPred;

# View(yPred);

#下面进行作图

plot(y~x,col="black",pch=16);
lines(yConf[,"lwr"]~x,col="blue",lty=3);
lines(yConf[,"upr"]~x,col="blue",lty=3);
lines(yPred[,"upr"]~x,col="green",lty=2);
lines(yPred[,"lwr"]~x,col="green",lty=2);
lines(yPred[,"fit"]~x,col="red",lty=1);
