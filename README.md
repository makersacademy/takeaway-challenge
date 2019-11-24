Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  R.C. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
Description
-------

This project is a partial solution for the takeway challenge at Makers Academy, London. This is a work in progress.
As I wanted to spend more time understanding how Twilio works in Ruby and what RSpec tests it needs, I put together a very simple data model.

It lets you:

- create an order
- add multiple portions of the same dish to your order
- see the order with each price per dish
- check the total against the prices of the dishes added to the order

Things to be added:

- create takeaway.rb plus spec file where I require_relatives of menu, order, sms, customer
- in takeaway.rb do dependecy injection for menu_class, order_class, customer_class and initialize alongside sms
- use stubs in sms and takeaway spec files
- write methods for: show menu, create order, add dish, remove dish(also to be added to order.rb), show order, place order
- potentially remove the customer class altogether


User stories
-------

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
```
User stories not covered:
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
How to use
-------
* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Enter following commands in irb/pry:

To start:
```
require './lib/order.rb'
require './lib/customer.rb'
require './lib/menu.rb'
```
To create a new menu:
```
menu = Menu.new({ "kimchi" => 5, "fried rice" => 7, "salmon" => 10} )
```
To create a customer account:
```
customer = Customer.new("1234")
```
To create an order:
```
order = Order.new(menu, customer)
```
To add dishes to your order:
```
example:
order.add_dish("kimchi", 1)
```
To see the summary of your order:
```
puts order.summary

example:
kimchi x 2 = £10
salmon x 2 = £20
fried rice x 1 = £7
```
To cross check your summary with your total:
```
puts order.total

example:
37
```
