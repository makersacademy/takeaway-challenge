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

Description
-------

This software is a simulation of a takeaway order. The customer can view the menu, add items to the order, remove items from the order, view the basket and place the order. A confirmation text message is sent to the customer via Twilio API after the order is placed.

How to download the program
-----
* Clone this repo
* Run the command 'bundle install' to ensure you have all the relevant gems installed
* Update .env.template with your Twilio credentials and rename it as .env
* Run the program in IRB by requiring 'order.rb'

Output example
-----
```shell
| => irb -r './lib/order.rb'
3.0.1 :001 > order = Order.new
 =>
#<Order:0x00007ffe0d213d48
...
3.0.2 :002 > order.menu.view_dishes
Olives £2.5
Pizza £10
Risotto £18
Steak £20
Tiramisu £7.5
Panna cotta £6.5
 => {"Olives"=>2.5, "Pizza"=>10, "Pasta"=>12, "Risotto"=>18, "Burger"=>13, "Steak"=>20, "Tiramisu"=>7.5, "Panna cotta"=>6.5}
3.0.2 :003 > order.add_dish("Pizza")
 => 10
3.0.2 :004 > order.add_dish("Paella")
/Users/Valentina/Projects/makers_projects/takeaway-challenge/lib/menu.rb:24:in `check_availability': Dish not available. Please make a new selection. (RuntimeError)
        from (irb):5:in `<main>'
        from /Users/Valentina/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :005 > order.add_dish("Steak")
 => 20
3.0.2 :006 > order.view_basket
1x Pizza £10
1x Steak £20
----------------
Order Total £30
 => nil
3.0.2 :007 > order.remove_dish("Paella")
/Users/Valentina/Projects/makers_projects/takeaway-challenge/lib/order.rb:39:in `check_basket': Item not in the basket! (RuntimeError)
        from /Users/Valentina/Projects/makers_projects/takeaway-challenge/lib/order.rb:19:in `remove_dish'
        from (irb):9:in `<main>'
        from /Users/Valentina/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :008 > order.place_order(2)
/Users/Valentina/Projects/makers_projects/takeaway-challenge/lib/order.rb:71:in `review_payment': Please enter the correct payment amount. (RuntimeError)
        from /Users/Valentina/Projects/makers_projects/takeaway-challenge/lib/order.rb:31:in `place_order'
        from (irb):10:in `<main>'
        from /Users/Valentina/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/Valentina/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :009 > order.place_order(10)
 => <Twilio.Api.V2010.MessageInstance body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 17:34 num_segments: 1 direction: outbound-api from: +************* to: +************* date_updated: 2022-03-06 16:34:03 +0000>
```

Commands explained
-----
1. Create a new order:
```shell
order = Order.new
```
2. View menu (dishes and prices):
```shel
order.menu.view_dishes
```
3. Add item to the order (use the same command to add the item as many times as you wish):
```shell
order.add_dish("Pizza")
```
4. Remove item from the order:
```shell
order.remove_dish("Pasta")
```
5. View the order to check items, prices and total:
```shell
order.view_basket
```
6. Pay for the order:
```shell
order.place_order(20)
```
7. Receive the confirmation SMS via Twilio

Info about software construction
-----

### User Stories used to design the software

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

### Steps taken to build the software

1. Domain modelling and diagramming to design the software implementation
2. Installation of the relevant gems (Twilio, etc.)
3. Built Menu class following TDD approach
4. Built Order class following TDD approach
5. Built Order class following TDD approach
5. Edge cases taken into account: wrong item added to the order; wrong item removed from the order; view basket when empty; place order when basket empty; wrong payment amount entered.

### Classes and methods explained

1. #####Menu
    * Properties
    * Methods

2. #####Order
    * Properties
    * Methods

3. #####TextMessage
    * Properties
    * Methods

Technologies used
-----
* Ruby
* Simplecov for testing coverage (test coverage: 100%)
* Rubocop for code style check

Future implementations to consider
-----
Implement the ability to place orders via text message.


[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
