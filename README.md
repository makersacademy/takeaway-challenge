Takeaway Challenge
==================

This project simulates a takeaway restaurant, where customers can order items from a menu and receive a confirmation SMS with a delivery time. This app uses the Twilio API for the messaging function, and was an introdution to using API's within my code.

The following user stories were provided:

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

### Features

* Customers can view the menu to see the available dishes
* Dishes are ordered by name and quantity
* Total order and cost are displayed
* SMS sent to customer confirming time of delivery


### Installing

```
git clone https://github.com/cbp10/takeaway-challenge.git
bundle
```
Tests can be run using RSpec
```
rspec
```

It can be run in command line as follows:

```
irb
2.5.0 :001 > require './lib/takeaway'
 => true 
2.5.0 :002 > dinner = Takeaway.new
 => #<Takeaway:0x00007fefc62c7aa0 @menu=#<Menu:0x00007fefc62c7a28 @food_menu=[{:dish=>"Burger", :price=>5}, {:dish=>"Pizza", :price=>7}], @order=#<Order:0x00007fefc62c7a00 @total_order=[]>>> 
2.5.0 :003 > dinner.see_menu
 => "Burger - £5, Pizza - £7" 
2.5.0 :004 > dinner.order("Burger", 1)
 => "Ordered - Burger x 1" 
2.5.0 :005 > dinner.order("Burger", 1)
 => "Ordered - Burger x 1" 
2.5.0 :006 > dinner.order("Pizza", 1)
 => "Ordered - Pizza x 1" 
2.5.0 :007 > dinner.check_order
 => "Order: Burger x 2, Pizza x 1  Total: £17" 
2.5.0 :008 > dinner.confirm_order(17)
```

