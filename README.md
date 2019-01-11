## Running tests
In the terminal write `rspec`

## Coverage

COVERAGE:  98.40% -- 123/125 lines in 8 files

## Using the App

In the terminal write `irb`
```
to start a new order:
order = Order.new()

to check menu:
order.check_menu

to add an item to order:
* the first value is the item and the second the quantity, if you want more than one.
order.add_item(:soup, 2)

to change an item quantity:
* the item you want to change and the new quantity
order.change_item_quantity(:soup, 1)

to check the bill total:
* it will display only the bill value
order.bill_total

to check order summary:
* it will display the item and the total value for it
order.check_order_summary

to confirm an order:
order.confirm_order

to place an order:
order.place_order
```

## User Stories
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
* running in the terminal `order.check_menu`

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
* running in the terminal: order.add_item(:soup, 2), order.add_item(:meat, 2)

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
* running in the terminal: order.bill_total and then order.check_order_summary

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order has been placed you will receive a sms shortly" after I have ordered
* running in the terminal: order.confirm_order then order.place_order
```

```
2.5.0 :001 > require './lib/order'
 => true 
2.5.0 :002 > order = Order.new()
 => #<Order:0x00007fb3bc9f1588 @restaurant=#<Restaurant:0x00007fb3bc9f1560 @name="Deli", @menu={:soup=>6.0, :meat=>10.0, :chicken=>8.0, :bruschetta=>5.0, :hummus=>5.0, :halloumi=>5.0, :coke=>2.0, :juice=>2.0, :beer=>1.5, :wine=>6.0}>, @order_list={}, @confirmed=false, @menu={:soup=>6.0, :meat=>10.0, :chicken=>8.0, :bruschetta=>5.0, :hummus=>5.0, :halloumi=>5.0, :coke=>2.0, :juice=>2.0, :beer=>1.5, :wine=>6.0}> 
2.5.0 :005 > order.add_item(:soup, 2)
 => "Item: soup, Quantity: 2, has been added to your order" 
2.5.0 :006 > order.add_item(:meat, 2)
 => "Item: meat, Quantity: 2, has been added to your order" 
2.5.0 :007 > order.bill_total
 => 32.0 
2.5.0 :008 > order.check_order_summary
 => [:soup, 12.0, :meat, 20.0] 
2.5.0 :009 > order.confirm_order
 => true 
2.5.0 :010 > order.place_order
 => "Thank you! Your order has been placed you will receive a sms shortly" 
```
