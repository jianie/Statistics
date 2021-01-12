getwd()
setwd("C:/Users/������/Desktop/R")
View()
listfiles()

a<- read.table("acc.txt" , header=TRUE ,sep="\t") 
dim(a)
head(a)

ex<-read.csv("acc.csv",head=TRUE)

res = lm(����ڼ� ~ ��������ڵ�, data=ex)
res
summary(res)  #r-squared ��:  17 �ۼ�Ʈ �����Ѵ�  

res = lm(����ڼ� ~ �������, data=ex)
res
summary(res)  #0.8�ۼ�Ʈ


res = lm(����ڼ� ~ ����, data=ex)
res
summary(res)   #0.7�ۼ�Ʈ �����Ѵ� 


res = lm(����ڼ� ~ �浵, data=ex)
res
summary(res)  

 #0.03�ۼ�Ʈ �����Ѵ� 

step(res)



#multivariate analysis
res = lm ( ����ڼ� ~ ��������ڵ� + ������� + ���� + �浵+��ġ�ڵ� + ����ڼ� , data=ex)
res
summary(res)   

  #17�ۼ�Ʈ�� �����Ѵ� 

step(res)

#########################################################################

#chi-test

#��̻������ �ƴ���
ex$acci<- ifelse(ex$��������ڵ�>2,1,0)
ex$num<- ifelse(ex$����ڼ�>5,2,3)
chisq.test ( ex$acci, ex$num ) 

a3<- table ( ex$acci , ex$num )
a3

install.packages("Rcmdr")
library(Rcmdr)
rowPercents(a3)   
colPercents(a3)

#����Ⱦ�ܻ������ �ƴ���
ex$acci<- ifelse(ex$��������ڵ�==5,1,0)
ex$num<- ifelse(ex$����ڼ�>5,2,3)
chisq.test ( ex$acci, ex$num ) 

a4<- table ( ex$acci , ex$num )
a4

install.packages("Rcmdr")
library(Rcmdr)
rowPercents(a4)   
colPercents(a4)