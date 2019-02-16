# Takeway Challenge

## Create an app that follows the attached User Stories. This document contains the early domain mapping and feature test commands that would be required for each user story in IRB.

## WARNING: Inorder to use texting functionality you must do the following.......[INSERT LATER]

## User Stories
As a customer\
So that I can check if I want to order something\
I would like to see a list of dishes with prices
```
Nouns: Customer, Dish, Menu, Takeaway
Verbs: see_menu
```
```
require './lib/takeaway.rb'
takeaway = Takeaway.new
takeaway.show_menu

=> Expect list of menu items with price
```
As a customer\
So that I can order the meal\
I would like to be able to select some number of several available dishes with menu numbers
```
Nouns: Order, Dish, Menu
Verbs: select, available?
```
```
require './lib/takeway.rb'
takeaway = Takeaway.new
takeaway.see_menu
takeaway.order(1,2)
takeaway.view_order

=> Expect to see list containing the items selected and the total cost
```

As a customer\
So that I can verify that my order is correct\
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
Nouns: Order, Dish, Menu
Verbs: check_total
```
```
require './lib/takeway.rb'
takeaway = Takeaway.new
takeaway.see_menu
takeaway.order(1,2)
takeaway.view_order
takeaway.check_order_total

=> Expect check order total to return true
```
As a customer\
So that I am reassured that my order will be delivered on time\
I would like to receive a text such as \
"Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
Nouns: Order, Text
Verbs: confirm_order, receive_text
```
require './lib/takeway.rb'
takeaway = Takeaway.new
takeaway.see_menu
takeaway.order(1,2)
takeaway.view_order
takeaway.check_order_total
takeaway.confirm_order

=> Expect to receive a text saying a message with current time + 1 hour
```