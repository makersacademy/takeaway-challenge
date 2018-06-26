# Makers Academy Week Two - Takeaway Challenge
> 23-24 June 2018

Second week (weekend) solo project, focusing on object interaction and TDD. The goal is to build an operational restaurant management system which displays menus to customers, takes their order and confirms that it has been placed via text message.

[Full project details and user stories here.](https://github.com/makersacademy/takeaway-challenge)

## Completion

* All features & user stories fully implemented.
* All tests passing with 100% coverage.
* Code conforms to Rubocop style guide.
* Order class re-designed after successful code review.

## Learning Outcomes

Having originally written the Order class to include user input (see previous commits), I re-assessed my approach after code review and re-wrote the order class using unit tests as guidance.
The user input from previous commits has been completely removed and replaced with simple functions designed to take input as arguments. This is a far more straightforward approach while still fulfilling the user stories, and has helped significantly improve my understanding of the interaction between classes and user input.
I also benefitted from re-writing the unit tests, which gave me the opportunity to problem-solve using doubles within the order/sms confirmation process.

## Technical

Written in Ruby using Rspec for unit tests & irb for feature testing.

## Implementation

```shell
irb
require './lib/menu.rb'
require './lib/order.rb'
menu = Menu.new('My Restaurant Menu')
menu.add_item('Beef', 4.25)
menu.add_item('Chicken', 3.5)
menu.lists_items # => Puts a formatted menu to the terminal
order = Order.new(menu)
order.add_item('Beef', 5) # => "Beef x 5 has been added to your order."
order.add_item('Chicken', 2) # => "Chicken x 2 has been added to your order."
order.subtotal # => "£28.25"
order.confirm_price(28.25) # => "Order total is correct."
order.confirm_order # => "Please check your phone for order updates."
```

## Further Improvements

* Twilio information to be embedded as Environment variables.
* Further practice with mocking/doubles would be beneficial.
