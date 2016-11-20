#### Takeaway Challenge  

## "Pierozki"
==================
```
                            _________
              r==           |   <3  |
           _  //            |  Pier |   ))))
          |_)//(''''':      |  ozki |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

 ==================
 Welcome to "Pierozki", a take-away serving Polish vegan cuisine.
 Warning!!! Seriously delicious!

 This project is a simulation of a take-away service I prepared as a part of web development course at Makers Academy, London.  
 
 It lets you:
 - see a menu of available dishes,
 - create an order,
 - add multiple portions of dishes to your order
 - see order
 - check if the order sum total is correct
 - remove unwanted items from your order
 - place an order (and get a confirmation text message wit ETA of your order!)   

 ==================

User stories covered:  

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

### How to use:
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Enter following commands in irb/pry:  

- To see available dishes (pay attention to index numbers of dishes, you will need them for ordering):  
```
require './lib/menu'
menu = DishesMenu.new
menu.show_dishes
```   

- To create an order:   
```
require './lib/take_away'
my_order = Order.new
```  

- To add dishes to your order:  
```
order.add(dish_index, quantity)
```   

- To see your order:  
```
order.show_order
```   

- To remove a position from your order enter following command with dish index as shown on your order (not on the menu!):  
```
order.remove(dish_index_from_order)
```  

- To check if your total is correct:  
```
order.correct?
```   

- To place your order:  
```
delivery = TakeAway.new
delivery.place(my_order)
```   
Number specified in send_text private method will receive a text message with order confirmation and ETA. This code can be easily updated to accept any number as an argument, but then it would need a premium Twilio account to operate.



This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

[![Build Status](https://travis-ci.org/CrystalPea/takeaway-challenge.svg?branch=master)](https://travis-ci.org/CrystalPea/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/CrystalPea/takeaway-challenge/badge.png)](https://coveralls.io/r/CrystalPea/takeaway-challenge)
