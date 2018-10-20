library(EBImage);
F1 <- system.file('images','sample-color.png',package = 'EBImage');

birds <- readImage(F1);
#原图
birds;

display(birds);

#增加亮度

birds2 <- birds+0.5;

display(birds2);

#增加对比度

birds3 <- birds*3;
display(birds3);

#调高伽玛系数

birds4 <- (birds+0.2)^3;
display(birds4);

#增加滤镜

fhi <- matrix(1,nrow = 3,ncol = 3);
fhi[2,2] <- -8;
birds_fhi <- filter2(birds,fhi);
display(birds_fhi);
