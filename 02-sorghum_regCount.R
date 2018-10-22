library(biOps);
# get file name
f <- system.file('examples','images','sorghum.jpg',package = 'rinds');
#read the image.
sorghum <- readJpeg(f);
#显示原始图
plot(sorghum);
sorghum_eldge <- imgHomogeneityEdgeDetection(sorghum,bias = 64);

#识别边缘并作图
plot(sorghum_eldge);
#plot(sorghum);

#数据进一步处理
library(rinds);
imgKM_biOps <-imgEKMeans(sorghum,2);

# 查看相关数据

#plot(imgKM_biOps);

imgKM_EBImage <- biOps2Image(imgKM_biOps);

#查看转换后的数据
#plot(imgKM_EBImage);
imgKM <-Image(imgKM_EBImage[,,1],colormode = "Grayscale");
#转换后的数据
# plot(imgKM);

#针对数据做进一步的处理

imgKM@.Data[imgKM@.Data == min(imgKM@.Data)] <-1 ;
imgKM@.Data[imgKM@.Data != 1] <- 0 ;
# 处理后变成 只有黑白两种颜色
# plot(imgKM);

imgbw <- bwlabel(imgKM);

#plot(imgbw);

sorghum_EBImage <- biOps2Image(sorghum);

img_out <- paintObjects(imgbw,sorghum_EBImage,col="red");
display(img_out);

#计算相关的信息; 

img_infoCount <- computeFeatures.shape(imgbw);

img_infoCount;
