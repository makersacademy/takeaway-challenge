Takeaway Challenge Beta (FreddieCodes)
=====================================

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

Instructions
---------
Program requires Ruby & Twilio
You can run this program in irb.

```
$  irb
>> require "./lib/order.rb"
=> true
>> require "./lib/menu.rb"
=> false
>> require "./lib/app.rb"
=> false
>> order1 = Order.new
=> #<Order:0x007fd7b943f3f8 @menu=#<Menu:0x007fd7b943f3d0 @dishes={"Pizza"=>4.0, "Burger"=>5.0, "Lobster"=>12.0, "Salmon"=>7.0, "Halloumi"=>9.0}>, @order_list={}>
>> order1.add_order("Lobster", 2)
=> "You have ordered Lobster - x 2"
>> order1.show_basket
Lobster x2 = £24.0
=> "Total: £24.0"
>> order1.complete_order(24.0)

```
To start the program `require "./lib/order.rb"`, `"./lib/menu.rb"` and `"./lib/app.rb"` as shown above.

* To start an order `order1 = Order.new`   
* To add an item to your order `order.add_order(item, quantity) `
* To edit a selection `order1.edit_selection(item, quantity)`
* To remove a selection `order1.remove_selection(item)`
* To show basket `order1.show_basket`
* To complete order `order1.complete_order(price)`

Airports cannot land or takeoff during stormy weather. The weather at an airport is determined using a random number generator (found in weather.rb).

Planes cannot depart from a different airport to the one it landed at.

Description
-----
Below are user stories I used to design this software:

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

Although the code implements all of the user stories it is still in beta.

Scheduled updates:
* added functionality to order system e.g.
* Splitting the order method into two

The final release will be arriving in the near future.

Files
---------
`app.rb`
`menu.rb`
`order.rb`

The Journey
---------
* TDD - using feature tests and unit tests to guide implementation
* Building classes and methods that fulfill the user story
* Using stubs and allows to isolate unit tests (using rspec)
* Writing code in compliance with rubocop
* Refactoring
* Testing for edge cases
