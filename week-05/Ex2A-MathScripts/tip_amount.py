#Values
meal_cost = 39.00
tax_rate = 0.10
tip_rate = 0.20

#Calculations
tax = meal_cost * tax_rate
tip = meal_cost * tip_rate
total_bill = meal_cost + tax + tip

#Output

print("The tip on a $" + str(meal_cost) + " restaurant bill is $" + str(total_bill))