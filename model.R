##Read data
insurance <-read.csv("/home/diwash/Projects/Medical_Expense_Predictor/data/insurance.csv",stringsAsFactors = TRUE)
#str(insurance)
summary(insurance$charges)

#Finding relationships among the features
cor(insurance[c("age","bmi","children","charges")])

#scatterplot matrix
pairs( insurance[c("age", "bmi", "children","charges")])

library(psych)
pairs.panels(insurance[c("age","bmi","children","charges")])

##training model

ins_model <- lm(charges ~ . ,data = insurance)

# inspect the model 
ins_model

##Evaluate model perdormance
summary(ins_model)

##Adding non linear relationship

insurance$age2 <- insurance$age^2
insurance$bmi30 <- ifelse(insurance$bmi >= 30, 1, 0)


## improved regression model
ins_model2 <- lm(charges~ age + age2 + children + bmi + sex + bmi30*smoker + region , data = insurance)

summary(ins_model2)

saveRDS(ins_model2, "./final_model.rds")

