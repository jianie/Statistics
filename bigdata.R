getwd()
setwd("C:/Users/������/Desktop/R")
View()
listfiles()

o1<- read.table("1_EMR data_sex.txt" , header=TRUE ,sep="\t") 
dim(o1)
a1<-o1
a1<- a1[complete.cases(a1) , ] 
dim(a1)
a1[1:10 , ]        # a1 ( pid-sex)

o2<- read.table("2_APP data_e.txt" , header=TRUE ,sep="\t")
dim(o2)
data2<- o2[ , c(1,3)  ] 
dim(data2)
data2[1:10 , ]    # data2 ( id - steps - pid)

data2$pid=data2$A_myhealth_id
data2[ 1:10 ,  ] 
data2_1<-data2[  , c(2:3)  ]
a2<- data2_1
a2 [ 1:10 ,  ]  # a2 ( steps - pid )
dim(a2) 

#merge �̿��ؼ� ��ġ��
r2<-merge ( a1, a2, key=pid )  
r2[1:20 , ]  
dim(r2)

#�ѻ���� ���پ� ������ �����
r4 <- aggregate (r2$A_steps , list ( r2$pid ) , mean )
r4 [1:20 , ]   #�ѻ���� step �� ���

r5<-aggregate ( r2$sex, list ( r2$pid) , mean )
r5 [1:20 , ]  #�ѻ���� sex �� ���
r5$sex=r5$x   # sex���x �� sex�κ���
r5[1:20 , ]
r7<-r5 [ , c(1,3) ] #r5�� ù��°, 3��° �ٸ� select
r7[1:10, ]

r8<- merge ( r4, r7, key = Group.1 )
r8[1:10 , ]  # ���� ������ ������ ( Group.1-x / Group1-sex)
dim(r8)

r9<- aggregate ( r8$x , list ( r8$sex), mean)
r9
r4<-aggregate( r2$A_steps , list (r2$sex) , mean )
r4

#���Լ����� �߽ɱ������������� �� �׷�� 30�� �̻��� �Ǹ� ���Ժ����� ������ 
qqnorm(r8$x)  
qqline(r8$x)

hist(r8$x)

shapiro.test(r8$x)  #p-value�� 0.05���� Ŀ�� ���Ժ��� =>�����Ƿ� ���Ժ��������� ���� 
                   #�߽ɱ������������� ������� ��� �̿��Ѵ� 

#t-test - pvalue�� 0.05���� ũ�ϱ� �� �������� ��� step���̰� ��������� ���ǹ��� ���̰� ���� 
t.test(x ~ sex, data=r8,var.equal=FALSE, conf.level = 0.95 )

#��л���� 0.05���� ������ �� ���� steps �� ���� ����(�л�) �� �ٸ��� 
var.test(x ~ sex , data=r8 , conf.level = 0.95)