getwd()
setwd("C:/Users/������/Desktop/R")
View()
listfiles()


ex<-read.csv("acc.csv",head=TRUE)
ex[1:3 , 1:10]

#Test of normal distribution
qqnorm(ex$����ڼ�)
qqline(ex$����ڼ�)

dim(ex)
aa<-ex[1:5000,]
shapiro.test(aa$����ڼ�)  

#Test for equality of two variances
ex$�ڵ�<- ifelse(ex$��������ڵ�==5,1,0)
var.test(����ڼ� ~ �ڵ� , data=ex , conf.level = 0.95)

#T-Test
t.test(����ڼ� ~ �ڵ�, data=ex,var.equal=FALSE, conf.level = 0.95 )

#anova
out=aov ( ����ڼ� ~  factor (�����������) , data=ex )
summary(out) 

#pearson correlation
head(ex)
plot (���� ~ ����ڼ� , data=ex )

#���İ���
install.packages('agricolae')
library(agricolae)
TukeyHSD(out)
plot ( TukeyHSD(out) )