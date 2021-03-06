######### Example of One-sample t-tests
######### Ex 1
x = c(0.593, 0.142, 0.329, 0.691, 0.231, 0.793, 0.519, 0.392, 0.418)
t.test(x, alternative="greater", mu=0.3,conf.level = 0.95)

######### Example of Two-sample t-tests
######### Two-sample t-tests (Pooled variance)
Control = c(91, 87, 99, 77, 88, 91)
Treat = c(101, 110, 103, 93, 99, 104)
t.test(Control,Treat,alternative="less", var.equal=TRUE,conf.level = 0.95)

######### Two-sample t-tests (Separated variance)
Standard =  c(35, 104, 27, 53, 72, 64, 97, 121, 86, 41 )
New =  c(27, 52, 46, 33, 37, 82, 51, 92, 68, 62 )
t.test(Standard,New,alternative="two.sided", var.equal=FALSE)

######### Example of One-way ANOVA assumption
######### Ex 1
pain = c(4, 5, 4, 3, 2, 4, 3, 4, 4, 6, 8, 4, 5, 4, 6, 5, 8, 6, 6, 7, 6, 6, 7, 5, 6, 5, 5)
drug = c(rep("A",9), rep("B",9), rep("C",9))
migraine = data.frame(pain,drug)
migraine

aov.out = aov(pain ~ drug, data=migraine)
summary(aov.out)
TukeyHSD(aov.out)


######### Example of Two-way ANOVA assumption
######### Ex 1 Two-way ANOVA
bloodpressure <- c(158,163,173,178,168,188,183,198,178,193,186,191,196,181,176,185,190,195,200,180)
biofeedback <- factor(c(rep("present",10),rep("absent",10)))
drug <- factor(rep(c(rep("use",5),rep("notuse",5)),2))
bpdata <- data.frame(bloodpressure, biofeedback, drug)
bpdata

myanova <- aov(bloodpressure ~ biofeedback*drug)
summary(myanova)

TukeyHSD(myanova,which="biofeedback:drug")

######### Ex 2 Two-way ANOVA
delivery.df = data.frame(
  Service = c(rep("Carrier 1", 15), rep("Carrier 2", 15),
    rep("Carrier 3", 15)),
  Destination = c(rep(c("Office 1", "Office 2", "Office 3",
    "Office 4", "Office 5"), 9)),
  Time = c(15.23, 14.32, 14.77, 15.12, 14.05,
  15.48, 14.13, 14.46, 15.62, 14.23, 15.19, 14.67, 14.48, 15.34, 14.22,
  16.66, 16.27, 16.35, 16.93, 15.05, 16.98, 16.43, 15.95, 16.73, 15.62,
  16.53, 16.26, 15.69, 16.97, 15.37, 17.12, 16.65, 15.73, 17.77, 15.52,
  16.15, 16.86, 15.18, 17.96, 15.26, 16.36, 16.44, 14.82, 17.62, 15.04)
)

myanova <- aov(Time ~ Service*Destination, data= delivery.df)
summary(myanova)

TukeyHSD(myanova,which="Service:Destination")
                   
######### Ex 3 Two-way ANOVA
setwd('D:\\Workshop')

D = read.csv("Stree.csv", header = TRUE)
 
myanova <- aov(SCORE ~ METHOD*GENDER, data= D)
summary(myanova)
TukeyHSD(myanova,which="METHOD:GENDER")


