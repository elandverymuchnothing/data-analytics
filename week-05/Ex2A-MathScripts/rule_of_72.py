#Savings amount
current_savings = 63000

#Interest rate (510)
interest_rate = 0.10

#Rule of 72 
years = 72 / (interest_rate * 100)

#Doubled savings amount
doubled_savings = current_savings * 2

#Output
print("Your current savings is", format(current_savings, ".2f") + ".")

print(
    "At a", format(interest_rate, ".0%"),"interest rate, your savings account will be")

print("worth", format(doubled_savings, ".2f"), "in", format(years, ".1f"), "years")