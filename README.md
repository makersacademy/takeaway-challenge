##Takeaway
_____________________

Makers Academy week 2 challenge. The task was to create a takeaway system achieving the following; a customer can place an order, calculate the total, and if the total is correct would receive a text message informing them when their order would be delivered.

This was changed to the following: a customer can view a menu (as a whole sorted by category). The error scenario was changed to an order minimum error (a customer must order more than the minimum otherwise an error is raised)

##Tools Used
* Ruby
* Rspec
* Twilio


## Domain Model / CRC

A menu contains a list of dishes, their respective category and their price.
When the customer add an item to his order, the order checks if the item exists on the menu.
When the customer submits the order, the order checks if the total is above the minimum ordering amount.
The text message is then sent using the Twilio API.


Classes
-------

* Menu
* Order
* Dish
* Takeaway (wrapper class to initalized instances of menu and order, possibility of creating built in menu)

Modules
-------
* Twilio

___________________________

##How to use takeaway

To use in irb:
```shell
require './lib/takeaway'
takeaway = Takeaway.new
```
Load the built in menu:
```shell
takeaway.build_menu
```
Or build your own menu and dishes (item name, category, price):
```shell
salad = Dish.new('Garden Salad','Starter',6)
takeaway.menu.add(salad)
takeaway.menu.remove(salad)
```
Display the menu:
```shell
takeaway.menu.display
```

Order
To add an item and quantity to your order:
```shell
takeaway.order.add_item('Garden salad', 3)
```
To view a summary of your order before submitting it:
```shell
takeaway.order.summary
```
To submit your order:
```shell
takeaway.order.submit
```

## Things I need to work on

Everything works in IRB, but having trouble in RSPEC for testing the order.

Features missing:
- being able to remove a menu item
- being able to only view one category on the menu


