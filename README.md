Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
## How to order from our restaurant

Please initialise IRB and require './lib/order.rb'
Create a new order by typing order = Order.new
To see the menu, just type order.print
To select a dish and add it to your basket, please type order.select("dish") [Don't forget the inverted commas!] :)


User Stories
-------

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
--------
## Domain Model

Nouns: customer, list of dishes and prices, total, sum, time, text
Verbs: order, select, check (the total matches the sum), receive


| customer       | receive        |
|----------------|:---------------|
| order          | select, check  |
|----------------|:---------------|
| list of dishes | see, select    |


-------
## Dev

Developed by Gui Heurich as part of a weekend challenge at Makers Academy, London.

Written in Ruby, tested using Rspec (and Rubocop).
