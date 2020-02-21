library(stats)
library(Rlab)

#code for a one-sample hypothesis test function
OneSampTest <-function(type=NULL, tails=NULL, alpha, mu, n, x_bar, sd)
{
  #calculate the test statistic
  se = (sd/sqrt(n))
  test_stat <- (x_bar-mu)/(sd/sqrt(n))
  
  if (type=="z") {  
    #get the p-value for this test statistic
    if (tails =="two") {  p_val <-  2*pnorm(abs(test_stat), lower.tail=FALSE) 
    } else if (tails=="left") {p_val <-  pnorm(test_stat , lower.tail=TRUE)
    } else if (tails=="right") {p_val <-  pnorm(test_stat , lower.tail=FALSE)
    } else {stop("please choose tails as two, left, or right")}
  }
  else if (type =="t") {
    #define df
    df <- n-1  
    #get the p-value for this test statistic
    if (tails =="two") { p_val <- pt(abs(test_stat), df, lower.tail=FALSE) 
    } else if (tails=="left") {p_val <- pt(test_stat , df,lower.tail=TRUE)
    } else if (tails=="right") {p_val <- pt(test_stat , df, lower.tail=FALSE)
    } else {stop("please choose tails as two, left, or right")}
  }
  else {stop("please choose z or t")}
  
  #check if significant
  if (p_val <alpha) {sig <-"significant"
  }  else {sig <-"not significant"}
  
  
  ret <- list(type=paste("One Sample", type, "test.", tails, "tailed"), mu=mu, n=n, x_bar=x_bar, se=se, test_stat = test_stat, p = p_val, alpha = alpha, significance = sig )
  #return the list
  return( ret )
}

#Task 1
#create vector of size 100 drawn from Normal(4,5) distribution
popnorm <- rnorm(100,4,5)
#running the function for popnorm with null hypothesis = "the mean of the population is equal to 0", and confidence level = 0.95
OneSampTest("z","two",0.05,0,100,mean(popnorm),sd(popnorm))
#test statistic = 8.517037
#p-value = 1.636871 * 10^-17
#Conclusion: we can reject the null hypothesis, i.e. the mean of the population is not equal to 0

#Task 2
#we are using same vector "popnorm" as in Task 1
#running the function for popnorm with null hypothesis = "the mean of the population is greater than or equal to 4.2", and confidence level = 0.975
OneSampTest("t","right",0.025,4.2,100,mean(popnorm),sd(popnorm))
#test statistic = 0.1173179
#p-value = 0.4534229
#Conclusion: we fail to reject the null hypothesis

#Task 3
#still using same vector "popnorm" as in Task 1
#running the t.test function from the stats package for popnorm with null hypothesis = "the mean of the population is greater than or equal to 4.2", and confidence level = 0.975
t.test(x = popnorm, y = NULL, alternative = c("less"), mu = 4.2, paired = FALSE, var.equal = FALSE, conf.level = 0.975)
#test statistic = 0.1173179
#p-value = 0.1068
#Conclusion: as the estimated mean supports the alternative/contradicts the null hypothesis, we can reject the null hypothesis, i.e. the mean of the population is not greater than or equal to 4.2

OneSampBern <-function(type=NULL, tails=NULL, alpha, mu, n, x_bar, sd)
{
  #calculate the test statistic
  se = (sd/sqrt(n))
  test_stat <- (x_bar-mu)/(sd/sqrt(n))
  
  if (type=="z") {  
    #get the p-value for this test statistic
    if (tails =="two") {  p_val <-  2*pnorm(abs(test_stat), lower.tail=FALSE) 
    } else if (tails=="left") {p_val <-  pnorm(test_stat , lower.tail=TRUE)
    } else if (tails=="right") {p_val <-  pnorm(test_stat , lower.tail=FALSE)
    } else {stop("please choose tails as two, left, or right")}
  }
  else if (type =="t") {
    #define df
    df <- n-1  
    #get the p-value for this test statistic
    if (tails =="two") { p_val <- pt(abs(test_stat), df, lower.tail=FALSE) 
    } else if (tails=="left") {p_val <- pt(test_stat , df,lower.tail=TRUE)
    } else if (tails=="right") {p_val <- pt(test_stat , df, lower.tail=FALSE)
    } else {stop("please choose tails as two, left, or right")}
  }
  else {stop("please choose z or t")}
  
  #check if significant
  if (p_val <alpha) {sig <-"significant"
  }  else {sig <-"not significant"}
  
  
  ret <- list(type=paste("One Sample", type, "test.", tails, "tailed"), mu=mu, n=n, x_bar=x_bar, se=se, test_stat = test_stat, p = p_val, alpha = alpha, significance = sig )
  #return the list
  return( ret )
}

#Task 4
#Create vector of size 100 drawn from 100 independent Bernoulli trials, with success probability of 0.3
popbern <- rbern(100, 0.3)
prop <- prop.table(popbern)

#running the function for popbern with null hypothesis = "the mean of the population is greater than or equal to 4.2", and confidence level = 0.975
OneSampBern("z","two",0.05,0.28,100,mean(popbern),sqrt((prop)(1-prop)))
#test statistic = ?
#p-value = ?
#Conclusion: ?

#Task 5
#Using the same vector as Task 4
#running the function for popbern with null hypothesis = "the population proportion is less than or equal to 0.35", and confidence level = 0.975
OneSampBern("z","two",0.05,0.28,100,mean(popbern),sqrt((prop)(1-prop)))
#test statistic = ?
#p-value = ?
#Conclusion: ?