# Makers Academy Week Two - Takeaway Challenge
> 23-24 June 2018

Second week (weekend) solo project, focusing on object interaction and TDD. The goal is to build an operational restaurant management system which displays menus to customers, takes their order and confirms that it has been placed via text message.

[Full project details and user stories here.](https://github.com/makersacademy/takeaway-challenge)

## Completion

* All features fully implemented.
* All tests passing.
* Code conforms to Rubocop style guide.
* Significant refactoring and unit testing needed (see below).

## Difficulties

I found this challenge surprisingly difficult, which stemmed from my uncertainty around how certain unit tests should be conducted (testing for both user input and STDOUTPUT).
I also felt reliant on using loops to track user input within the Order class, and this added further confusion to the TDD process. Unfortunately, I ended up writing the user input methods without individual unit tests as I found myself running out of time and unable to find an adequate solution. As a consequence:
* Several methods within the Order class need significant refactoring, removing the reliance on long conditional loops.
* Unit tests should help to guide this process, meaning I need a better understanding of both loops and input/output testing.

## Learning Outcomes

Despite having problems with the looping and testing process, I improved my understanding of class dependency significantly this week as I kept Classes as independent and modular as possible. Looking at my personal learning objectives from last week, this challenge gave me a solid grasp of how public/private methods work (and the problems they can cause as identified above), along with an improvement in understanding of attribute readers/writers/accessors.

## Technical

Written in Ruby using Rspec for unit tests & irb for feature testing.

## Implementation

Pre-load './spec/order_irb.rb' into irb for a pre-defined list of dishes.

'menu.add_item' - Adds a new item to the menu (taken as a (string, float) argument)
'menu.list_items' - Displays a list of all items currently on the menu.
'order.place_order' - Guides user through a series of prompts and sends a text confirmation on completion.

```shell
irb
source('./spec/order_irb.rb')
menu.add_item('Chicken', 3.5)
menu.list_items # => Puts a list of menu items
# ------------------------------
# Restaurant Menu
# ------------------------------
# 1. Beef - £3.25
# 2. Curry - £3.00
# 3. Roast dinner - £3.50
# 4. Pork - £3.00
# 5. Fish and chips - £3.17
# 6. Chicken - £3.50
order.place_order
# Which dish would you like to order? (exit to finish)
Fish and chips
# What quantity of this dish would you like to order?
1
# Which dish would you like to order? (exit to finish)
exit
# Please enter the total amount for your order:
3.17
# Order total is correct. Please check your phone for confirmation.
```

## Further Improvements

* Refactoring order methods, removing reliance on conditional loops.
* Appropriate unit testing before implementing the above.
* Improve understanding of loops.
* Improve understanding of testing output and user input.
