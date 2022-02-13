# Noah Abrigo
# Dr. Halil Bisgin
# CSC 302
# 11 Feb 2022

#Homework 2

#Problem 1
df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))
aggregate(df1$Sales, by=list(df1$State), FUN=sum)

library(dplyr)
df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))

# The first couple lines creates a dataframe object with the columns
# Name, State, and Sales. The aggregate command sums the sales by state and 
# organizes the alphabetically. The library imports the dplyr library. Then the
# df1 dataframe is grouped by state and the column of sales is renamed to sum_sales

#Problem 2 (WorldCupMatches.csv)

#2a Find the size of the data frame.How many rows,how many columns?
df2 = read.delim('/Volumes/GoogleDrive-102679206261466047710/My Drive/2021-2022/Winter 2022/Data Visualization CSC302/Rscripts/WorldCupMatches.csv', sep = ',', header = TRUE)
ncol(df2)
nrow(df2)
#2b Use summary function to report the statistical summary of your data.
summary(df2)
#2c Find how many unique locations olympics were held at.
unique(df2$City)
#2d Find the average attendance.
mean(df2$Attendance, na.rm = TRUE)
#2e For each Home Team,what is the total number of goals scored? (Hint:Please refer to question 1)
aggregate(df2$Home.Team.Goals, by=list(df2$Home.Team.Initials), FUN=sum)
#2f What is the average number of attendees for each year? Is there a trend or pattern in the data in that sense?
library(dplyr)
df2 %>%
  group_by(Year) %>%
  summarise(Avg_Att = mean(Attendance))
#The year 1994 had the highest average attendees 68991 out of any year.
#The popularity of the sport increased after 1962 since the average number of attendees nearly doubled after that year.

#Problem 3 (metabolite.csv)

# 3a Find how many Alzheimers patients there are in the dataset. (Hint:Please refer to question1)
library(dplyr)
df3 = read.delim('/Volumes/GoogleDrive-102679206261466047710/My Drive/2021-2022/Winter 2022/Data Visualization CSC302/Rscripts/metabolite.csv', sep = ',', header = TRUE)
df3 %>% count(Label, sort=TRUE)
# 3b Determine the number of missing values for each column. (Hint:is.na()
colSums(is.na(df3))
# 3c Remove the rows which has missing value for the Dopamine column and assign the result to a new dataframe. (Hint: is.na( ) )
dopamine_na <- df3[is.na(df3$Dopamine),]
df3 <- df3[is.na(df3$Dopamine)==FALSE,]
# 3d In the new dataframe, replace the missing values in the c4-OH-Pro column with the median value of the same column. (Hint: there is median( ) function.)
dopamine_na[is.na(dopamine_na$c4.OH.Pro),] <- median(dopamine_na$c4.OH.Pro, na.rm = TRUE)
