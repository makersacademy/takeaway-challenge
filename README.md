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
Introduction
-------
The purpose of this repository is to satisfy the user stories listed below. The code was developed using TDD to design 
and implement new features as required.

User Stories
-------
The client has requested software to operate a takeaway capable of receiving and dispatching orders.

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

Getting Started
-------

* Clone this repo
* Run `bundle install` in the project directory to install the required gems 
* Register on Twilio and get a Twilio number.
* Create a .ENV file in the project directory to store the following from Twilio:
    * ACCOUNT_SID
    * AUTH_TOKEN
    * TWILIO_NUMBER

An example irb transcript is shown below to demonstrate how the app is used. An instance of `Takeaway` should be used to
place orders

```
2.4.0 :001 > require './lib/takeaway'
 => true 
2.4.0 :002 > my_takeaway = Takeaway.new
 => (return hidden) 
2.4.0 :003 > my_takeaway.display_menu
Breakfast Menu
Pancakes...£3.00
Waffles...£2.00
Full English...£6.00
French Toast...£4.00
Poached Eggs...£3.00
Cereal...£2.00
Fruit Salad...£3.00
Croissant...£1.00
Tea...£1.00
Coffee...£2.00
 => (return hidden) 
2.4.0 :004 > my_takeaway.add_to_cart("Pancakes")
 => #<ShoppingCart:0x0000000209ee60 @total=3, @items=[#<Dish:0x0000000209f310 @name="Pancakes", @price=3>]> 
2.4.0 :005 > my_takeaway.add_to_cart("Waffles")
 => #<ShoppingCart:0x0000000209ee60 @total=5, @items=[#<Dish:0x0000000209f310 @name="Pancakes", @price=3>, #<Dish:0x0000000209f270 @name="Waffles", @price=2>]> 
2.4.0 :006 > my_takeaway.add_to_cart("Curry")
RuntimeError: Dish not found in menu
(trace hidden)
2.4.0 :007 > my_takeaway.add_to_cart("French Toast")
 => #<ShoppingCart:0x0000000209ee60 @total=9, @items=[#<Dish:0x0000000209f310 @name="Pancakes", @price=3>, #<Dish:0x0000000209f270 @name="Waffles", @price=2>, #<Dish:0x0000000209f1d0 @name="French Toast", @price=4>]> 
2.4.0 :008 > my_takeaway.remove_from_cart("Waffles")
 => #<ShoppingCart:0x0000000209ee60 @total=7, @items=[#<Dish:0x0000000209f310 @name="Pancakes", @price=3>, #<Dish:0x0000000209f1d0 @name="French Toast", @price=4>]> 
2.4.0 :009 > my_takeaway.checkout("+441234567891")
Pancakes...£3.00
French Toast...£4.00
Total...£7.00
Order placed at...14-01-2018 19:15:21
```

After checking out, the customer will receive an SMS at the number provided e.g:

```Thank you! Your order was placed and will be delivered before 20:15```

Design
-------
The following classes were created to perform the required operations:

* `Dish`
    * Has a name and a price.
* `DishPrinter`
    * Can print dishes.
* `DishListPrinter`
    * Can print an array of dishes.
    * Consumes instance of `DishPrinter`.
* `Menu`
    * Stores a list of dishes that can be ordered.
    * Can add/remove dishes.
    * Can lookup dishes by name.
* `MenuPrinter`
    * Can print an instance of `Menu`.
    * Consumes instance of `DishListPrinter`.
* `ShoppingCart`
    * Can store a list of dishes to order.
    * Can add/remove dishes to the cart.
    * Can be emptied.
* `ShoppingCartPrinter`
    * Can print the contents of a `ShoppingCart`.
    * Consumes instance of `DishListPrinter`.
* `Order`
    * Can store a list of dishes ordered.
    * Can provide the order total and time.
* `OrderPrinter`
    * Can print summary of an `Order` showing dishes ordered, the order total, and time.
    * Consumes instance of `DishListPrinter`.
* `TwilioService`
    * Can send the user an SMS confirming delivery time.
    * Uses Twilio REST API.
* `Takeaway`
    * Should be used as the controller.
    * Can display the takeaway's menu.
    * Can add/remove items to/from instance of `ShoppingCart`.
    * Can checkout `ShoppingCart`, creating an `Order` and dispatching an SMS.
    
Testing
-------
The unit tests below all passed with 100% coverage of the code. Edge cases were specifically targeted in addition to 
tests satisfying the user stories above.

```
DishListPrinter
  prints a list of dishes

DishPrinter
  prints a dish
  fails to print something that is not a dish

Dish
  has a name
  has a price

Takeaway features
  can place an order

MenuPrinter
  prints the menu name
  prints dishes
  fails to print something that is not a menu

Menu
  #initialize
    has a name
    is empty on initialize
  #add
    adds a dish to menu
    adds two dishes to menu
    fails if dish is not in menu
    returns the dish
  #remove
    removes a dish from the menu
    does not remove other dishes

OrderPrinter
  prints dishes
  prints order total and time
  fails to print something that is not an order

Order
  #initialize
    fails if no items were ordered
    contains ordered items
    has the correct total
    knows the time at which the order was placed

ShoppingCartPrinter
  prints dishes
  prints shopping cart total
  fails to print something that is not a shopping cart

ShoppingCart
  #initialize
    is empty
  #add
    adds an item to the cart
    adds the item's price to the cart total
  #remove
    removes an item
    does not remove other items
    deducts the removed item's price from the cart total
  #empty
    is empty
    resets cart total to zero

Takeaway
  #initialize
    has a menu
    has a menu containing 10 items
    creates a menu printer
    creates an order printer
    has a shopping cart
    creates a twilio service
  #display_menu
    prints a menu out
  #add_to_cart
    adds an item to the cart
  #remove_from_cart
    removes an item from the cart
  #checkout
    empties shopping cart
    returns an order
    prints the order
    sends a text

TwilioService
  creates a Twilio REST client
  sends an SMS


Finished in 0.03422 seconds (files took 0.5024 seconds to load)
50 examples, 0 failures

COVERAGE: 100.00% -- 380/380 lines in 23 files
```

A feature test was written to test the process a customer might go through when placing an order. This passes.

Next steps
-------
* Implement functionality for customers to place orders via SMS.