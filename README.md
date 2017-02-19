Takeaway Challenge
==================
Author: Courtney Osborn
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

Task
-------

This program allows you to see a menu, order food, calculate the price and then send a message to indicate that the order is on its way  

To Use Program
--------------
- $ git clone git@github.com:CourtneyLO/takeaway-challenge.git

Install Gems
------------
You require the following gems:

- gem 'rspec'
- gem 'capybara'
- gem 'rake'
- gem 'twilio-ruby'

To install the following gems, confirm that they are in the Gemile and then run:

-$ bundle install

(Ensure that you have bundler installed and initialized)

Run Program
-----------

Use IRB or PRY:

- require './lib/order.rd
- Create a new menu, order and sms class
- See dishes on the menu
- Select several dishes from the menu
- Check total of all dishes you have selected
- Receive text message that order is on it's way

Run Tests
---------

- $ rspec


IRB
-----
takeaway-challenge git:(master) pry

```
[1] pry(main)> require './lib/order.rb'
=> true
```
```
[2] pry(main)> order = Order.new(Menu)
=> #<Order:0x007f9a344f4338 @current_order=nil,
@menu_class=Menu>
```
```
[3] pry(main)> order.view_menu
=> #<Menu:0x007f9a344a63e0

@our_menu=
[{:number1=>1, :starter1=>:soup, :price=>5},
{:number2=>2, :starter2=>:mussels, :price=>7},
{:number3=>3, :starter3=>:carpaccio, :price=>6},
{:number4=>4, :main1=>:steak, :price=>12},
{:number5=>5, :main2=>:chicken, :price=>11},
{:number6=>6, :main3=>:salad, :price=>10},
{:number7=>7, :dessert1=>:milktart, :price=>6},
{:number8=>8, :dessert2=>:cheesecake, :price=>7},
{:number9=>9, :dessert3=>:tiramisu, :price=>7},
{:number10=>10, :drinks1=>:wine, :price=>8},
{:number11=>11, :drinks2=>:beer, :price=>5},
{:number11=>12, :drinks3=>:coke, :price=>3}],
@users_order=[]>
```
```
[4] pry(main)> order.order_food(3,3)
=> {:number3=>3, :main1=>:steak, :price=>12, :quantity=>3}
```
```
[5] pry(main)> order.order_food(4,1)
=> {:number4=>4, :main2=>:chicken, :price=>11, :quantity=>1}
```
```
[6] pry(main)> order.calculate_price
=> "The total cost is £47"
```
```
[7] pry(main)> order.send_sms("Your order is on its way")
=> <Twilio::REST::Message
@path=/2010-04-01/Accounts/AC931d30987b9634469ecc155be9841575/Messages/SM82585e84b85f46ccb859da922a15ddf9>
```

Full Instructions: Task Set Out To Complete
-------------------------------------------

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
