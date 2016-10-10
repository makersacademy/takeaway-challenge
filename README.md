#Takeaway Challenge#

Interface in use:
```Ruby
2.3.1 :001 > require './lib/takeaway'
 => true
2.3.1 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x007fa9a1a522e0>
2.3.1 :003 > takeaway.new_order
 => #<Order:0x007fa9a1a83228 @menu=#<Menu:0x007fa9a1a83200 @menu=[{:num=>1, :name=>"Milano", :price=>19.99}, {:num=>2, :name=>"Peperoni Passion", :price=>18.99}, {:num=>3, :name=>"Magarita", :price=>14.99}, {:num=>4, :name=>"Texas BBQ", :price=>18.99}, {:num=>5, :name=>"Vegi Supreme", :price=>17.99}, {:num=>6, :name=>"American Hot", :price=>16.99}, {:num=>7, :name=>"Mighty Meaty", :price=>18.99}, {:num=>8, :name=>"Roma", :price=>19.99}, {:num=>9, :name=>"Garlic Pizza Bread", :price=>3.99}, {:num=>10, :name=>"Potato Wedges", :price=>3.99}, {:num=>11, :name=>"Chicken Wings", :price=>5.99}]>, @selection=[], @order_price=0>
2.3.1 :004 > takeaway.order.show_menu
1. Milano : £19.99
2. Peperoni Passion : £18.99
3. Magarita : £14.99
4. Texas BBQ : £18.99
5. Vegi Supreme : £17.99
6. American Hot : £16.99
7. Mighty Meaty : £18.99
8. Roma : £19.99
9. Garlic Pizza Bread : £3.99
10. Potato Wedges : £3.99
11. Chicken Wings : £5.99
2.3.1 :005 > takeaway.order.select_item(5)
 => [{:num=>5, :name=>"Vegi Supreme", :price=>17.99}]
2.3.1 :006 > takeaway.order.select_item(10)
 => [{:num=>5, :name=>"Vegi Supreme", :price=>17.99}, {:num=>10, :name=>"Potato Wedges", :price=>3.99}]
2.3.1 :007 > takeaway.order.select_item(1)
 => [{:num=>5, :name=>"Vegi Supreme", :price=>17.99}, {:num=>10, :name=>"Potato Wedges", :price=>3.99}, {:num=>1, :name=>"Milano", :price=>19.99}]
2.3.1 :008 > takeaway.order.select_item(7)
 => [{:num=>5, :name=>"Vegi Supreme", :price=>17.99}, {:num=>10, :name=>"Potato Wedges", :price=>3.99}, {:num=>1, :name=>"Milano", :price=>19.99}, {:num=>7, :name=>"Mighty Meaty", :price=>18.99}]
2.3.1 :009 > takeaway.order.select_item(11)
 => [{:num=>5, :name=>"Vegi Supreme", :price=>17.99}, {:num=>10, :name=>"Potato Wedges", :price=>3.99}, {:num=>1, :name=>"Milano", :price=>19.99}, {:num=>7, :name=>"Mighty Meaty", :price=>18.99}, {:num=>11, :name=>"Chicken Wings", :price=>5.99}]
2.3.1 :010 > takeaway.order.select_item(11)
 => [{:num=>5, :name=>"Vegi Supreme", :price=>17.99}, {:num=>10, :name=>"Potato Wedges", :price=>3.99}, {:num=>1, :name=>"Milano", :price=>19.99}, {:num=>7, :name=>"Mighty Meaty", :price=>18.99}, {:num=>11, :name=>"Chicken Wings", :price=>5.99}, {:num=>11, :name=>"Chicken Wings", :price=>5.99}]
2.3.1 :011 > takeaway.order.order_summary
1 x Milano : 19.99
1 x Vegi Supreme : 17.99
1 x Mighty Meaty : 18.99
1 x Potato Wedges : 3.99
2 x Chicken Wings : 5.99
Your order total is £72.94
 => nil
2.3.1 :012 > takeaway.place_order
1 x Milano : 19.99
1 x Vegi Supreme : 17.99
1 x Mighty Meaty : 18.99
1 x Potato Wedges : 3.99
2 x Chicken Wings : 5.99
Your order total is £72.94
SM0d26c0ae47be46488ea45134b1408623
```

##Week 2 - Weekend Challenge##
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

User stories
-------

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

Our challenge this weekend was to make a "Take Away Application"

A Simple take away application that takes user orders and sends text messages with their order information and when it will be delivered via Twilio API.


Program Features

- Listing of dishes with prices
- Users are able to place orders by choosing dishes from the menu, their quantities and confirming the total cost. If the sum provided by the user is not correct, an error is raised.
- If the total cost provided is correct, the customer is sent a text confirming the order was placed successfully and that it will be delivered 1 hour from the time of order.
- The text sending functionality was implemented using the Twilio API
- A Gemfile must be used to manage gems
- Mocks were used to prevent texts from being sent when tests are run

- Takeway Class Methods:
  - .new_order -> this starts a new order by creating a instance of the Order class.
  - .place_order -> will complete the order and send a sms message to the user confirming the order and telling them it will arrive in an hour. An error will be raised if the total is incorrect.

- Order Class Methods:
  - .show_menu -> displays the menu to the output
  - .select_item(item_number) -> use the menu item number to select what you want to order.
  - .order_summary -> shows a break down of the order on the output.

- Message Class Methods:
  - .send_message -> send a message the user using the Twilio API.

Technologies used

```
Ruby
RSpec
Twilio
```

How to use

In irb:
```
require ./lib/takeaway.rb
```

How to test
[status badge](https://travis-ci.org/fmlharrison/takeaway-challenge.svg?branch=master)
```
git clone https://github.com/codepreneur/takeaway
cd takeaway
rspec
```
