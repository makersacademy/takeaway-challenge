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

This is a program that simulates a customer ordering a takeaway. The user is able to start new orders, add to the current order and check the bill which prints the total cost of the current order on the bottom. The [Order class](./lib/order.rb) contains the methods for monitoring the current order which can be started using the [Takeaway class](./lib/takeaway.rb). Both of these classes also contain information regarding the [Menu class](./lib/menu) which stores the items in the takeaway. Once the customer is satisfied with their order, they can then place the order using the takeaway class which uses the [text file](./lib/text.rb) to then send a confirmation text to the phone number that is stored in the environment variables.

Getting Started
-----
To set up:
```
git clone https://github.com/jmcnally17/airport_challenge.git
bundle
```
Run `gem install bundler` first if you haven't already got it installed.

How to Use
-----
Then, when in the [parent](.) directory:
```
irb
require './lib/takeaway'
```
The takeaway file is the only file needed to be loaded as it indirectly requires all other files in the [lib](./lib) directory.

The user can then start using the takeaway class by using `<takeaway_name> = Takeaway.new`. Showing the menu and then starting an order will be done by:
```
<takeaway_name>.show_menu
<takeaway_name>.start_new_order
```
The user can then start adding items to their order with `<takeaway_name>.add_to_order(<item_name>)` if the `<item_name>` is present in the menu. Then the total cost of the order can be checked using `<takeaway_name>.check_bill` for placing the order with `<takeaway_name>.place_order` which will then send the confirmation text to the number provided in an environment variables document that the user can create(which is hidden from Github due this being sensitive information).

Tests
-----
Tests were ran during the development of this program. Full coverage wasn't completely achieved but the user can run `rspec` from the [main](.) directory to see the results of these tests.

_Note: The rspec tests did not cover the order being placed. A lot of time had been spent on this challenge and I felt that I wouldn't have been as productive figuring out how to run an rspec test without sending the confirmation text. I am happy with the general function of the program and may research how to cover these parts of the challenge later._

User Stories
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
