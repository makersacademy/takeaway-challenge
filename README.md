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


Getting started
---
1. Fork this repo
1. Run `bundle` in the project directory
1. Use `rspec` to run your tests
1. Use `rubucop` to fix syntax errors

Task
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


How my app would look like from a user perspective
---
```rb
[1] pry(main)> require './lib/dish.rb'
=> true
[2] pry(main)> require './lib/menu.rb'
=> true
[3] pry(main)> require './lib/order.rb'
=> true
[4] pry(main)> require './lib/takeaway'
=> true
[5] pry(main)> require './lib/messager.rb'
=> true
[6] pry(main)> messager = Messager.new
=> #<Messager:0x00007fa2a1165198>
[7] pry(main)> takeaway = Takeaway.new(messager)
=> #<Takeaway:0x00007fa2a0f0e2a0 @messager=#<Messager:0x00007fa2a1165198>, @order=nil>
[8] pry(main)> dish1 = Dish.new('pizza', 10)
=> #<Dish:0x00007fa2a1137ab8 @name="pizza", @price=10>
[9] pry(main)> dish2 = Dish.new('potato', 3)
=> #<Dish:0x00007fa2a222ff78 @name="potato", @price=3>
[10] pry(main)> menu = Menu.new
=> #<Menu:0x00007fa2a221c838 @dish=nil, @dishes=[]>
[11] pry(main)> menu.add_dish(dish1)
=> [{:name=>"pizza", :price=>10}]
[12] pry(main)> menu.add_dish(dish2)
=> [{:name=>"pizza", :price=>10}, {:name=>"potato", :price=>3}]
[13] pry(main)>
[14] pry(main)> menu.show_menu
=> "Pizza: £10\nPotato: £3"
[15] pry(main)> order = Order.new(menu)
=> #<Order:0x00007fa2a11dc4a0
 @menu=
  #<Menu:0x00007fa2a221c838
   @dish=nil,
   @dishes=[{:name=>"pizza", :price=>10}, {:name=>"potato", :price=>3}]>,
 @summary={}>
[16] pry(main)> takeaway.new_order(order)
=> #<Order:0x00007fa2a11dc4a0
 @menu=
  #<Menu:0x00007fa2a221c838
   @dish=nil,
   @dishes=[{:name=>"pizza", :price=>10}, {:name=>"potato", :price=>3}]>,
 @summary={}>
[17] pry(main)> order.add(dish1, 1)
=> 1
[18] pry(main)> order.add(dish2, 2)
=> 2
[19] pry(main)> order.check_order
=> "Pizza: £10 x 1\nPotato: £3 x 2\nTotal: £16"
[20] pry(main)> order.place_order
=> "Pizza: £10 x 1\nPotato: £3 x 2"
[21] pry(main)> takeaway.complete_order
=> <Twilio.Api.V2010.MessageInstance account_sid: AC815cac0b6035b881ce280e3e01514709 api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you for your order: £16 date_created: 2018-09-16 10:48:42 +0000 date_updated: 2018-09-16 10:48:42 +0000 date_sent:  direction: outbound-api error_code: 0 error_message:  from: +447449606023 messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid: SM85d677646d5e4e7da2869d2c02490272 status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/AC815cac0b6035b881ce280e3e01514709/Messages/SM85d677646d5e4e7da2869d2c02490272/Media.json"} to: +447553027856 uri: /2010-04-01/Accounts/AC815cac0b6035b881ce280e3e01514709/Messages/SM85d677646d5e4e7da2869d2c02490272.json>
```

My approach to solving this challenge
---
1. I created a takeaway app that allow a customer to order food and get a text confirmation.
1. Using TDD:
  - I tested that a dish can be created with a name and a price
  - I tested that a dish can be added to the Menu
  - I tested that a customer can see the menu
  - I tested that an order can be placed
  - I tested that a dish can be added to an order
  - I tested that a customers can add several dishes
  - I tested that a customer can check their order and get a list of the dishes they chose with price and quantity and total price
  - I tested that a customer will get a text message to confirm their order
1. I also tested for edge cases such as:
  - A customer cannot order a dish that is not on the menu
  - An order cannot be placed if it is empty
1. In order to solve this challenge, I created 5 classes:
  1. Dish class: creates a dish with name and price
  1. Menu class: responsible for adding dishes to menu and showing menu to customers
  1. Order class: responsible for adding dishes to order and placing order(list of dishes with quantity, price and total)
  1. Takeaway class: responsible for completing order
  1. Messager class: responsible for sending message through Twilio
