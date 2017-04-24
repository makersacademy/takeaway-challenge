Takeaway Challenge, Makers Academy Week 2
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

## Installation
* Fork this repo
* Enter IRB/Pry
* Require './lib/takeaway.rb'
* Create a new instance: takeaway = Takeaway.new
* Available commands:  
  * view_basket
  * read_menu
  * order(item, quantity)
  * total
  * checkout(sum)

## Challenge

The purpose of this challenge was to implement a program that fulfilled the following user stories, whilst maintaining the principles of DRY, SRP and loosely coupled code that is maintainable.

### User Stories
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
