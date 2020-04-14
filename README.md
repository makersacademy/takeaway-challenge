# Takeaway Challenge

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

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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

## Code style

- OOD
- TDD

## Tech Used

- RSpec
- Ruby

## Features

You'll be able to:

- Create a takeaway
- Make an order
- Add food to an order
- See the menu
- Be able to place an order
- Get a text after making the order
  - You'll be told the cost
  - You'll be given an estimated arrival time

## Getting Started

This programme is used in the terminal.

## Local Setup

```sh
$ git clone https://github.com/kealanheena/takeaway-challenge.git
```

```sh
$ cd takeaway-challenge
```

#### To Start

- Run irb and require "./lib/takeaway.rb" and "./lib/order.rb" files in terminal.

## Running the tests

You can run tests by running "rspec" in takeaway-challenge file.

### Tests

### Takeaway Class

- #initialze
  - creates an array called menu on initalize
- #show_menu
  - return a hash of food items and their price
- #place_order
  - should take an order and calculate the cost of the order
  - should take an order and calculate the cost of the order
  - should take an order and calculate the cost of the order

### Order Class

- #initialize
  - should be initialized with an empty order array
- #add_food
  - should add an item to the order array
  - should add multiple items to the order array if a second argument is passed
  - should add multiple items to the order array if a second argument is passed


## Versioning

"takeaway-challenge" is using ruby version 2.6.3, to change ruby versions run "rvm install ruby-2.6.3" in terminal.
