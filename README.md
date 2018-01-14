# Takeaway Challenge

[![Coverage Status](https://coveralls.io/repos/github/Leigan0/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/Leigan0/takeaway-challenge?branch=master)

[![Build Status](https://travis-ci.org/Leigan0/takeaway-challenge.svg?branch=master)](https://travis-ci.org/Leigan0/takeaway-challenge)
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

-------
This code has been created to complete a challenge to create an Takeaway system to meet the user stories given.

I have aimed to solve this challenge using the BDD cycle, with a test driven approach.

I have included feature tests within the file - whilst I am aware these repeat some code, I have added individual tests for clarity at this stage in my progression. Also as unit tests isolated, similar feature tests implemented to confirm expected integration behaviour between classes.

## User stories
-----

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
## Getting started
* git clone git@github.com:Leigan0/takeaway-challenge.git
* cd takeaway-challenge
* bundle

## Usage
* To create menu = Menu.new
* Within menu - two constants of CHINESE_MENU_ITEMS, or INDIAN_MENU_ITEMS, user has option to add these items to menu
* To add from dishes from a constant  - menu.add_items_from_hash(CHINESE_MENU_ITEMS)
* To add dishes to menu - menu.add_items("name argument", price) e.g. menu.add_items('Chips', 2.00)
* To create a takeaway - takeaway = Takeaway.new(menu)
* Note, menu defaults with order class, to add alternative object - Takeaway.new(menu_arg, order_arg)
* Takeaway object will default load with a an empty menu object, you have the option to add an argument to load an alternative menu
* To print menu items to STDout - takeaway.print_menu
* To add items to order - takeaway.order_item(item, quantity) e.g takeaway.order_item("Fried Rice", 3)
* Error will be raised if item not available
* To verify order - takeaway.verify_order(order_total) e.g. takeaway.verify_order(15)
* Error will be raised if no items in basket
* If order total input matches order total then confirmation text message is sent

## Technologies used
* RSpec
* Ruby
* Twilio

## Running tests
* Rspec
