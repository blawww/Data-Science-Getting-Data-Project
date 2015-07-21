library(plyr)

labels <- read.table("./UCI HAR Dataset/features.txt", sep = " ", stringsAsFactors=F)
labels <- labels[,2]

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")


df1<-cbind(X_test,subject_test,Y_test)
df2<-cbind(X_train,subject_train,Y_train)
df3<-rbind(df1,df2)

colnames(df3)<-c(labels,"subject","activity")

a <- grep("mean",colnames(df3))
b <- grep("std",colnames(df3))
c <- c(a,b,562,563)
c <- c[order(c)]
df4 <- df3[,c]

df4$activity<-factor(df4$activity)

factornames <- c("walking","walking-up","walking-down","sitting","standing","laying")

for (i in 1:6){
    levels(df4$activity)[levels(df4$activity)==as.character(i)] <- factornames[i]
}


df5 = data.frame(matrix(NA,nrow=180,ncol=81))
colnames(df5)<-c("subject","activity",colnames(df4)[1:79])

for (i in 1:30){
    for (n in 1:6){
    x<-df4[df4$subject==i & df4$activity == factornames[n],1:79]
    df5[(i-1)*6+n,]<-c(i,factornames[n],sapply(x,mean))
    }
}

for (i in 3:81){
    df5[,i]<-as.numeric(df5[,i])
}

write.table(df5, file = "tidy.txt", row.name=F)
