#Savings amount
#current_savings = 63000

#Interest rate (510)
#interest_rate = 0.10

#Rule of 72 
#years = 72 / (interest_rate * 100)

#Doubled savings amount
#doubled_savings = current_savings * 2

#Output
#print("Your current savings is", format(current_savings, ".2f") + ".")
#print("At a", format(interest_rate, ".0%"),"interest rate, your savings account will be")
#print("worth", format(doubled_savings, ".2f"), "in", format(years, ".1f"), "years")


#Values
savings = float(input("How much money is in your savings account? "))
rate = float(input("What is the interest rate (as a percent)? "))

#Percent to decimal conversion
rate = rate / 100

#Rule of 72
years_to_double = 72 / (rate * 100)

#Doubled savings amount
future_value = savings * 2

print("Your current savings is", format(savings, ".2f") + ".")
print("At a", format(rate, ".0%"), "interest rate, your savings account will be")
print("worth", format(future_value, ".2f"), "in", format(years_to_double, ".1f"), "years")

# Possible pitfalls with input():
# 1. input() always starts as text; math will not work unless converted using float() or int()
# 2. Entering words instead of numbers will cause an error
# 3. Probably "0 by division" error if interest rate is 0%