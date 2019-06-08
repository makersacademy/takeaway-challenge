# Takeaway Challenge

## Requirements:
- I would like to see a list of dishes with prices
- I would like to be able to select some number of several available dishes
- I would like to check that the total I have been given matches the sum of the various dishes in my order
- I would like to receive a text such as “Thank you! Your order was placed and will be delivered before 18:52” after I have ordered


## Initial thoughts:

- After reading the user stories I identified the need for three classes: Order, Menu and CostCalculator
- I decided that the Order class would be the one the user primarily interacted with

## Basic running of the program
1. create a new instance of the Order class and pass it a menu in the form of a hash
2. view the menu by calling `order.view_menu`
3. place your order `order.place_order(dish, quantity)`
4. your order will be repeated back to you along with the running total
5. checkout with the imagined amount owed `checkout(payment)`
