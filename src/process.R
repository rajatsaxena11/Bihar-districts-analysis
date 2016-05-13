setwd("C:/Users/Rajat Saxena/Desktop")

dff <- data.frame(Female_to_Male_Ratio=double(),
                 Infants_per_Household=double(),
                 Ratio_of_Underpriviledged_Population=double(),
                 Literacy_rate=double(),
                 Male_Literacy_rate=double(),
		 Female_Literacy_rate=double(),
                 Working_population_ratio=double(),
                 Male_Working_population_ratio=double(),
                 Female_Working_population_ratio=double(),
                 Ratio_of_agriculture_to_industrial_households=double(),
                 stringsAsFactors=FALSE)

a1<-read.csv("a (1).csv", stringsAsFactors = FALSE)
a2<-read.csv("a (2).csv", stringsAsFactors = FALSE)
a3<-read.csv("a (3).csv", stringsAsFactors = FALSE)
a4<-read.csv("a (4).csv", stringsAsFactors = FALSE)
a5<-read.csv("a (5).csv", stringsAsFactors = FALSE)
a6<-read.csv("a (6).csv", stringsAsFactors = FALSE)
a7<-read.csv("a (7).csv", stringsAsFactors = FALSE)
a8<-read.csv("a (8).csv", stringsAsFactors = FALSE)
a9<-read.csv("a (9).csv", stringsAsFactors = FALSE)
a10<-read.csv("a (10).csv", stringsAsFactors = FALSE)

for (i in 1:10)
{
	m1 <- colMeans(a'num2str(i)')
	X <- vector(mode="double", length=10)

	X[1]=m1[3]/m1[4]
	X[2]=m1[5]/m1[1]
	X[3]=(m1[6]+m1[7])/m1[2]
	X[4]=m1[8]/m1[2]
	X[5]=m1[9]/m1[3]
	X[6]=m1[10]/m1[4]
	X[7]=m1[11]/m1[2]
	X[8]=m1[12]/m1[3]
	X[9]=m1[13]/m1[4]
	X[10]=m1[14]/m1[15]

	dff = rbind(dff,X)
}

write.csv(dff, file = "metrics.csv")

## add 4 new columns : District, Social_parameter, Economic_parameter, Women_upliftment_parameter
## explicitely add name of district in col 11

df<-read.csv("metrics.csv", stringsAsFactors = FALSE)

 for (i in 1:10){
df[i,12]= 1/(df[i,2]*df[i,3])
df[i,13]= (df[i,4]*df[i,7])/df[i,10]
df[i,14]= df[i,1]*(df[i,6]/df[i,5])*(df[i,9]/df[i,8])
 }


write.csv(df, file = "metrics_results.csv")

R <- df[with(df, order(-Social_parameter)), ] 
write.csv(R, file = "o1.csv")

R <- df[with(df, order(-Economic_parameter)), ] 
write.csv(R, file = "o2.csv")

R <- df[with(df, order(-Social_economic_parameter)), ] 
write.csv(R, file = "o3.csv")

