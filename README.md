# Takeaway Challenge

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/feezy26/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/feezy26/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)

## Introduction

Welcome to the Takeaway Challenge Program. This program allows users to view a menu of dishes, select a certain amount of said dishes and then place an order. 

The program calculates the total cost of the order and then sends a text message to confirm that the order has been placed. 

Different takeaway restaraunts can create their own takeaway, which comes with a built-in phone and ability to create dishes and add them to the menu. 

## Getting Started
### Requiring the File
Only the "takeaway" file needs to be required as this will require the rest of the files. 

	2.3.1 :001 > require './lib/takeaway'
	 => true
	 
## Building a Takeaway
	 
	 
### Creating a Menu

Before a takeaway can be created. The menu must be created, which is initialized with an empty array of dishes. 

	2.3.1 :002 > menu = Menu.new
 	=> #<Menu:0x007fd85b0f3350 @dishes={}>

### Adding Dishes to the Menu

A dish is created by specifying the name of the dish as a string, its menu number and then finally its price.

	2.3.1 :003 > pasta = Dish.new("Chicken Pasta", 52, 3)
	 => #<Dish:0x007ffd6a225bb8 @name="Chicken Pasta", @price=3, @number=52>
	 
It can then be added to the menu.

	2.3.1 :008 > pasta.add_to(menu)
	 => #<Dish:0x007ffd6a225bb8 @name="Chicken Pasta", @price=3, @number=52>

### Creating the Takeaway

	2.3.1 :009 > chinese_takeaway = Takeaway.new(menu)

And now the menu can be viewed. Our menu is pretty basic but you can add more dishes easily!

```
2.3.1 :015 > chinese_takeaway.menu
-----
52.Chicken Pasta
£3
```
## Ordering
### Creating a New Order

A new order is created by passing the chosen takeaway as an argument to its creation.

	2.3.1 :011 > order = Order.new(chinese_takeaway)
	
### Choosing Dishes

Choose a dish by passing its menu number to the method. 

(Add as many as you want!)

```
2.3.1 :012 > order.select(52)
 => 1
2.3.1 :013 > order.select(52)
 => 2
2.3.1 :014 > order.select(52)
 => 3 
```

### Checking the Total Cost

```
2.3.1 :010 > order.check
Here's your order so far:
3 - Chicken Pasta
Order Total: £0
```
### Placing the Order

The program uses Twilio to send a text message to the specified phone number confirming the order.

```
2.3.1 :016 > order.place(+447000000000)
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC04dfcfa3b1f088665f3a27c100f53232/Messages/SM839ba8dc6a9845688d98a5400ecdd662>
```

The order can then be seen in the takeaway's orders array. The second value being the quantity.

```
2.3.1 :018 > chinese_takeaway.orders
 => [{#<Dish:0x007ffd6a225bb8 @name="Chicken Pasta", @price=3, @number=52>=>3}]
```