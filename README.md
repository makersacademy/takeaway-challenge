Takeaway App
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
This is an app that allows a customer to view a takeaway menu and place an order, receiving a text confirmation with delivery estimate if the order is placed successfully.

How to run
-----
Require the main application file in irb
```
2.5.0 :001 > require './lib/takeaway.rb'
 => true
 ```
 Instantiate a takeaway object
```
2.5.0 :002 > t = Takeaway.new
 => #<Takeaway:0x00007fae351f8b10 @menu=#<Menu:0x00007fae351f8ae8 @dishes=[]>, @order_class=Order, @current_order=nil, @order_calculations=OrderCalculations>
 ```
 Add some dishes to the menu
```2.5.0 :003 > t.menu.add_dish(Dish.new("Pizza", 8))
 => [#<Dish:0x00007fae35200b58 @name="Pizza", @price=8>]
2.5.0 :004 > t.menu.add_dish(Dish.new("Pasta", 7))
 => [#<Dish:0x00007fae35200b58 @name="Pizza", @price=8>, #<Dish:0x00007fae3705d2e0 @name="Pasta", @price=7>]
2.5.0 :005 > t.menu.add_dish(Dish.new("Salad", 6.50))
 => [#<Dish:0x00007fae35200b58 @name="Pizza", @price=8>, #<Dish:0x00007fae3705d2e0 @name="Pasta", @price=7>, #<Dish:0x00007fae381dcef8 @name="Salad", @price=6.5>]
 ```
 View the formatted menu
```
2.5.0 :006 > t.view_menu
    Today's Menu
     Pizza - £8
     Pasta - £7
    Salad - £6.5
 => [#<Dish:0x00007fae35200b58 @name="Pizza", @price=8>, #<Dish:0x00007fae3705d2e0 @name="Pasta", @price=7>, #<Dish:0x00007fae381dcef8 @name="Salad", @price=6.5>]
 ```
 Start a new order
```
2.5.0 :007 > t.new_order
 => #<Order:0x00007fae381fcd70 @orderlines=[], @total=0, @order_calculations=OrderCalculations, @menu=#<Menu:0x00007fae351f8ae8 @dishes=[#<Dish:0x00007fae35200b58 @name="Pizza", @price=8>, #<Dish:0x00007fae3705d2e0 @name="Pasta", @price=7>, #<Dish:0x00007fae381dcef8 @name="Salad", @price=6.5>]>>
 ```
 Add some dishes to your order
```
2.5.0 :008 > t.add_to_order("Pizza", 2)
 => 16
2.5.0 :009 > t.add_to_order("Salad", 1)
 => 22.5
 ```
 Place your order passing in the correct total. This results in a confirmation text being sent. To configure Twilio text message functionality, see Environment Variables section below.
```
2.5.0 :010 > t.place_order(22.5)
 => <Twilio.Api.V2010.MessageInstance account_sid: ############## api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before '19:47' date_created: 2019-03-17 18:47:43 +0000 date_updated: 2019-03-17 18:47:43 +0000 date_sent:  direction: outbound-api error_code: 0 error_message:  from: +########### messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid: ################ status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/##############/Messages/######/Media.json"} to: +################ uri: /2010-04-01/Accounts/######/Messages/###########.json>
 ```
 Place your order passing in an incorrect total. This results in an error message.
 ```
 2.5.0 :011 > t.place_order(21.5)
 Traceback (most recent call last):
         3: from /Users/vi1551/.rvm/rubies/ruby-2.5.0/bin/irb:11:in <main>
         2: from (irb):11
         1: from /Users/vi1551/Makers/month_1/week_2/weekend_challenge/takeaway-challenge/lib/takeaway.rb:27:in place_order
 RuntimeError (Total cost given is incorrect, please recalculate and try again)
 ```

 Environment Variables
 -----
 Environment variables have been used for the Twillio (sending text) configuration. To configure your own environment, follow these steps:
1. Navigate to your project directory root and create a file called .env
2. Populate your .env file with the following:
```TWILIO_ACCOUNT_SID="your twilio account sid"
 TWILIO_AUTH_TOKEN="your twillio auth token"
 TWILIO_FROM_PHONE_NUMBER="your twilio number to send messages from"
 TWILIO_TO_PHONE_NUMBER="the number to send confirmation texts to"
 ```
