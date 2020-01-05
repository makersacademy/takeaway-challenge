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
 User stories
 ------------
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
 
Getting started
---------------
* Clone this git repository
* Run the command 'bundle' in the project directory to ensure you have all the gems

Usage
----------
```
$irb

2.5.0 :001 > require './lib/order.rb'
 => true

2.5.0 :002 > menu = Menu.new
 => #<Menu:0x00007fc2f9bf2ca0 @dishes=[{:dish=>"Egg fried rice", :price=>3}, {:dish=>"Sweet & sour fish", :price=>6}, {:dish=>"Morning glory", :price=>4}]>

2.5.0 :003 > menu.view
1. Egg fried rice: £3
2. Sweet & sour fish: £6
3. Morning glory: £4

2.5.0 :004 > order = Order.new
 => #<Order:0x00007fc2f85288d0 @basket=[]>

2.5.0 :005 > order.select_dish(1, 3)
3x Egg fried rice added to your basket
=> [{:dish=>"Egg fried rice", :total=>9}]

2.5.0 :006 > order.select_dish(3, 2)
2x Morning glory added to your basket
=> [{:dish=>"Egg fried rice", :total=>9}, {:dish=>"Morning glory", :total=>8}]

2.5.0 :007 > order.basket_summary
Egg fried rice, £9
Morning glory, £8
=> [{:dish=>"Egg fried rice", :total=>9}, {:dish=>"Morning glory", :total=>8}]

2.5.0 :008 > order.total
Your total bill is £17

2.5.0 :009 > order.checkout(17)
Your total bill is £17
 => <Twilio.Api.V2010.MessageInstance account_sid: ******* api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 11:39 date_created: 2019-10-27 10:40:00 +0000 date_updated: 2019-10-27 10:40:00 +0000

```

My approach
-----------
* **Menu** class contains dishes and prices and the functionality to view these in a list format.
* **Order** class allows user to select the desired quantity of dishes by their number on the menu and add these to a basket. User can view what is in their basket, see the total price and checkout their basket.
* **TextProvider** class holds functionality to send a text to the customer when their order is successfully placed using the Twilio API.
