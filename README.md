# Takeaway challenge

Task - Build a basic web app which integrates the Twilio API and allows user to place
an order and receive a text message confirmation with delivery time.

## Installation

- Clone this repo to your local computer
- Navigate to the repo `cd <repo name>`
- Run `gem install bundle` from the command line
- Run `bundle` from the command line

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

### Current coverage
COVERAGE:  93.91% -- 108/115 lines in 8 files

## IRB implementation
```
>> require "./lib/takeaway.rb"
=> true

>> mexican = Takeaway.new
=> #<Takeaway:0x007fcc42106998 @new_order=#<Order:0x007fcc42106970 @menu=#<Menu:0x007fcc42106948 @menu=[{:item_number=>1, :menu_item=>:vegetarian_enchiladas, :price=>9.99}, {:item_number=>2, :menu_item=>:vegetarian_tacos, :price=>9.99}, {:item_number=>3, :menu_item=>:vegetarian_chimichangas, :price=>9.99}, {:item_number=>4, :menu_item=>:vegetarian_burrito, :price=>9.99}, {:item_number=>5, :menu_item=>:chile_relleno, :price=>3.99}, {:item_number=>6, :menu_item=>:vegetarian_taquitos, :price=>4.99}]>, @basket=[], @total=0>>

>> mexican.new_order.total
=> 0

>> mexican.new_order.basket
=> []

>> mexican.new_order.select_item(3,2)
1. vegetarian_chimichangas - $9.99
2. vegetarian_chimichangas - $9.99
your total amount is $19.98 dollars
=> nil

>> mexican.new_order.select_item(4,1)
1. vegetarian_chimichangas - $9.99
2. vegetarian_chimichangas - $9.99
3. vegetarian_burrito - $9.99
your total amount is $29.97 dollars
=> nil

>> mexican.place_order
1. vegetarian_chimichangas - $9.99
2. vegetarian_chimichangas - $9.99
3. vegetarian_burrito - $9.99
your total amount is $29.97 dollars
SM5e2fdc5e8e214ec8b63a281d9945c011
Your order has been placed successfully! You will receive an SMS with your order time.
```
