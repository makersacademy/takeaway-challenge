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
## Task
-----

* To complete this challenge I had to create a program that fulfills these 4 user journeys:

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

* I eventually decided 3 new object class would be necessary: The takeaway, the order, and the checkout message

## Gems

- Over the course of development I used these gems:
```
ruby '2.5.0'

gem 'capybara'
gem 'rake'
gem 'rspec'
gem 'rubocop', '0.56.0'
gem 'simplecov'
gem 'simplecov-console'
gem 'twilio-ruby'
```
## Usage

- To use please just run the lib/takeaway.rb in IRB, and create a new Takeaway class:
```
takeaway = TakeAway.new
```
- Available methods are:
```
takeaway.view_dishes #displays the menu
takeaway.create_new_order #starts a new order
takeaway.add(item, amount) #adds a quantity of items to your order
takeaway.basket_summary #returns a nice summary of all items and total cost so far
takeaway.total #returns total cost so far
takeaway.checkout #displays summary, sends confirmation text and finishes order
```
