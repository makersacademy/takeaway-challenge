# George's Takeaway Challenge Attempt

I completed the first 3 user stories. Unfortunately (for now) I didn't have time to get the API/text message functionality up and running (had a busy weekend :p).

## Installation

Clone this repo, then bundle install the gems. To irb test, in the project directory you'll want to...

```bash
irb
```

## Usage (in irb)

```irb
require './lib/menu.rb'

menu = Menu.new

# please note, when making a new order, you need to specify which menu you are ordering from in the argument
order = Order.new(menu)

# try creating the set menu
menu.create_set_menu

# try adding an item on the set menu (after creating it) to your basket
order.add_to_basket("Teriyaki Chicken Noodles")

# try displaying the basket subtotal
order.show_basket_subtotal
```

## Next Steps

I will get the API/text message functionality up and running, as well as add little QOL changes such as 1) removing the requirement for the input of the add_to_basket to match character for character the name of something in the menu and 2) getting the decimal places to work correctly (if you add items to the menu with round prices, the float will go to 1 decimal place)

## Self-Assessment

As usual, I feel I can often be guilty of taking the scenic route with my code. Refactoring is definitely something I need to focus on. And upon thinking about it more, the description of the challenge didn't specify to provide user functionality to be able to add dishes to a menu, it was only for them to be able to order from a pre-existing menu with some associated functionality.
