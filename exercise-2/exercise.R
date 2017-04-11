

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100)

employees <- c(paste0(c("Employee "), c(1:100)))

# Create a vector of 2014 salaries using the runif function

salaries.2014 <- runif(c(1:100), 20000, 120000)

# Create a vector of 2015 salaries that are typically higher than the 2014 salaires (use runif again)

salaries.2015 <- runif(c(1:100), 30000, 120000)

# Create a data.frame 'salaries' by combining the vectors you just made

salaries <- data.frame(salaries.2014, salaries.2015)

# Create a column 'raise' that stores the size of the raise between 2014 and 2015

salaries$raise <- salaries$salaries.2015 - salaries$salaries.2014

# Create a column 'got.raise' that is TRUE if the person got a raise

salaries$got.raise <- salaries$raise > 0

# Retrieve values from your data frame to answer the following questions:

# What was the 2015 salary of employee 57

print(salaries$salaries.2015[[57]])

# How many employees got a raise?

print(sum(salaries$got.raise))

# What was the value of the highest raise?

print(max(salaries$raise))

# What was the name of the employee who recieved the highest raise?

index <- which.max(salaries$raise)
print(employees[index])


# What was the largest decrease in salaries between the two years?

print(min(salaries$raise))

# What was the name of the employee who recieved largest decrease in salary?

index <- which.min(salaries$raise)
print(employees[index])


# What was the average salary increase?

print(mean(salaries$raise))

### Bonus ###

# Write a .csv file of your salaries to your working directory

write.table(salaries, "salaries.csv")

# For people who did not get a raise, how much money did they lose?

total.loss <- sum(salaries$raise, salaries$got.raise)

# Is that what you expected them to lose?

TotalLoss <- function(num.employees) {
  employees <- c(paste0(c("Employee "), c(1:num.employees)))
  
  salaries.2014 <- runif(c(1:num.employees), 20000, 120000)
  salaries.2015 <- runif(c(1:num.employees), 30000, 120000)
  salaries <- data.frame(salaries.2014, salaries.2015)
  salaries$raise <- salaries$salaries.2015 - salaries$salaries.2014
  salaries$got.raise <- salaries$raise > 0
  return(sum(salaries$raise, salaries$got.raise))
}

### Double Bonus (no answer given) ###

# Repeat the above experiment 100 times, tracking the loss each time.
# Does the average loss equal what you expect?
# What about 10,000 times?

for(i in 1:100) {
  yearly.loss[i] <- TotalLoss(100)
}




