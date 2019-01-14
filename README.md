## Running tests
In the terminal write `rspec`

## Test Coverage

COVERAGE: 99.24%  -- 123/125 lines in 8 files

## Using the App

In the terminal write `irb`
```
to see restaurant options:
require './lib/menu'
include Menu
MENU

to choose a restaurant:
require './lib/restaurant'
oki = Restaurant.new('oki')

to check menu:
oki.display_menu

to start a new order with the restaurant:
require './lib/order'
oki_order = Order.new(oki)

to add an item to order:
* the first value is the item and the second the quantity, if you want more than one.
oki_order.add_item(:soup, 2)

to change an item quantity:
* the item you want to change and the new quantity
oki_order.change_item_quantity(:soup, 1)

to check the bill total:
* it will display only the bill value
oki_order.bill_total

to check order summary:
* it will display the item and the total value for it
oki_order.check_order_summary

to confirm an order:
oki_order.confirm_order

to place an order:
oki_order.place_order
```

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
I would like to receive a text such as "Thank you! Your order has been placed you will receive a sms shortly" after I have ordered
```

## IRB example
```
2.5.0 :001 > require './lib/menu'
 => true 
2.5.0 :002 > require './lib/restaurant'
 => true 
2.5.0 :003 > require './lib/order'
 => true 
2.5.0 :004 > include Menu
 => Object
2.5.0 :005 > MENU
 => {:oki=>{:soup=>6.0, :meat=>10.0, :chicken=>8.0, :yaksoba=>7.0, :rice=>3.0, :coke=>2.0, :juice=>2.0, :beer=>1.5, :wine=>6.0}, :red_lion=>{:fish=>5.0, :chicken=>6.0, :meat=>8.0, :breakfast=>9.0, :eggs=>5.0, :ale=>2.5, :coke=>2.0, :juice=>1.5}} 
2.5.0 :006 > oki = Restaurant.new('oki')
 => #<Restaurant:0x00007fed75c35860 @name="oki", @menu={:soup=>6.0, :meat=>10.0, :chicken=>8.0, :yaksoba=>7.0, :rice=>3.0, :coke=>2.0, :juice=>2.0, :beer=>1.5, :wine=>6.0}> 
2.5.0 :07 > oki.display_menu
 => {:soup=>6.0, :meat=>10.0, :chicken=>8.0, :yaksoba=>7.0, :rice=>3.0, :coke=>2.0, :juice=>2.0, :beer=>1.5, :wine=>6.0} 
2.5.0 :008 > oki_order = Order.new(oki)
 => #<Order:0x00007fed741e5230 @restaurant=#<Restaurant:0x00007fed75c35860 @name="oki", @menu={:soup=>6.0, :meat=>10.0, :chicken=>8.0, :yaksoba=>7.0, :rice=>3.0, :coke=>2.0, :juice=>2.0, :beer=>1.5, :wine=>6.0}>, @menu={:soup=>6.0, :meat=>10.0, :chicken=>8.0, :yaksoba=>7.0, :rice=>3.0, :coke=>2.0, :juice=>2.0, :beer=>1.5, :wine=>6.0}, @order_list={}, @confirmed=false> 
2.5.0 :009 > oki_order.add_item(:soup, 2)
 => "Item: soup, Quantity: 2, has been added to your order" 
2.5.0 :010 > oki_order.add_item(:yaksoba, 2)
 => "Item: yaksoba, Quantity: 2, has been added to your order" 
2.5.0 :011 > oki_order.check_order_summary
 => [:soup, 12.0, :yaksoba, 14.0] 
2.5.0 :012 > oki_order.change_item_quantity(:soup, 1)
 => "You've changed your order to Item: soup, Quantity: 1" 
2.5.0 :013 > oki_order.check_order_summary
 => [:soup, 6.0, :yaksoba, 14.0]
2.5.0 :014 > oki_order.bill_total
 => 20.0 
2.5.0 :015 > oki_order.confirm_order
 => true 
2.5.0 :016 > oki_order.place_order
 => "Thank you! Your order has been placed you will receive a sms shortly" 
```
