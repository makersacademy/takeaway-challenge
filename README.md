Takeaway Challenge
==================
This program allows users to view items from a menu and place orders.
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
## Motivations for this project

* Week 2 Makers Academy weekend challenge
* Demonstrate knowledge of Ruby
* Practise TDD
* Practise OOD & Write code that is easy to change
* Unit test classes in isolation using mocking

## User Stories

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

## Aproach
* 3 Classes: Menu, Order & Takeaway
* User interacts with the Takeaway Class which forwards methods on to Menu & Order

## Features

* Can see a list of items with prices `print_menu`
* Can select some number of several available dishes `add_to_order(item, quantity = 1)`
* Can view an order summary with a breakdown of items ordered & quantities `order_summary`
* Can view basket `basket`
* Can view order total `total`
* Can receive a text message on placing an order if correct sum is paid `place_order(sum)`
* Can clear order (resetting basket & total) `clear_order`


## Getting started

1. clone rep to your local machine `git clone path-to-repo`
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, `run bundle`

## Usage

App runs in the command line.
Run irb in terminal and `require './lib/takeaway.rb'`

## Running tests

Run tests using:
`rspec`

