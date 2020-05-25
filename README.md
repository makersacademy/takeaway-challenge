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

##PLAN##
-------
Visual representation of classes and methods:
```
Class: #Takeaway#
Methods:
  * visualise_menu
  * add_to_order(dish, quantity)
  * place_order(checking_number)
```
```
Class: #Menu#
Methods:
  * show_menu
  * in_menu?
```
```
Class: #Order#
Methods:
  * add_dish(dish, quantity)
  * single_item_price(dish)
  * order_price
```
```
Class: #Message#
Methods:
  * send_message
```

##FUCTIONALITIES(irb)##
It creates instance of the class Menu, Order, Message and Takeaway
```
2.6.5 :001 > require './lib/takeaway.rb'
 => true
2.6.5 :002 > menu = Menu.new
 => #<Menu:0x00007fb7cd3e82f8 @dishes={"marinara"=>5, "margherita"=>6, "napoli"=>6, "calzone"=>8}>
2.6.5 :003 > order = Order.new(menu)
 => #<Order:0x00007fb7cd401230 @items={}, @menu=#<Menu:0x00007fb7cd3e82f8 @dishes={"marinara"=>5, "margherita"=>6, "napoli"=>6, "calz
one"=>8}>>
2.6.5 :004 > message = Message.new
 => #<Message:0x00007fb7cd419948 @my_number="+447510060718", @time=2020-05-26 00:42:56 +0100>
2.6.5 :005 > takeaway = Takeaway.new(menu, order, message)
 => #<Takeaway:0x00007fb7cd433820 @menu=#<Menu:0x00007fb7cd3e82f8 @dishes={"marinara"=>5, "margherita"=>6, "napoli"=>6, "calzone"=>8} @order=#<Order:0x00007fb7cd401230 @items={}, @menu=#<Menu:0x00007fb7cd3e82f8 @dishes={"marinara"=>5, "margherita"=>6, "napoli"=>6,
 "calzone"=>8} @message=#<Message:0x00007fb7cd419948 @my_number="+447510060718", @time=2020-05-26 00:42:56 +0100>>
 ```
 It allows the user to visualise the menu:
 ```
 2.6.5 :006 > takeaway.visualise_menu
 => ["marinara - £5", "margherita - £6", "napoli - £6", "calzone - £8"]
 ```
 It allows the user to add dishes to their order and to raise error if the selected dish is not included in the Menu
 ```
 2.6.5 :006 > takeaway.visualise_menu
 => ["marinara - £5", "margherita - £6", "napoli - £6", "calzone - £8"]

 2.6.5 :008 > takeaway.add_to_order("Noodles", 2)
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'

        4: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):8
        1: from /Users/student/Desktop/Makers/Exercises/takeaway-challenge/lib/takeaway.rb:18:in `add_to_order'
RuntimeError (item not available)
```
It allows the user to confirm the order passing a checking number. This checking number must be equal to the order total price. If it is incorrect, the software raises an error. If it's correct it sends a confirmation message
```
2.6.5 :009 > takeaway.place_order(12)
Traceback (most recent call last):
        6: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        5: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'

        4: from /Users/student/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        3: from (irb):9
        2: from (irb):9:in `rescue in irb_binding'
        1: from /Users/student/Desktop/Makers/Exercises/takeaway-challenge/lib/takeaway.rb:25:in `place_order'
RuntimeError (wrong amount)

2.6.5 :010 > takeaway.place_order(18)
 => <Twilio.Api.V2010.MessageInstance account_sid: ACXXXXXXXXXXXXXXXXXXXXXXXX api_version: 2010-04-01 body: Sent from your Tw

ilio trial account - Your order is confirmed and it will arrive at 2020-05-26 00:54:00 +0100 date_created: 2020-05-25 22:55:08 +0000
date_updated: 2020-05-25 22:55:08 +0000 date_sent:  direction: outbound-api error_code:  error_message:  from: +12XXXXXXXX messaging
_service_sid:  num_media: 0 num_segments: 1 price:  price_unit: USD sid: SMXXXXXXXXXXXXXXXXXXXXXXXX status: queued subresourc
e_uris: {"media"=>"/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXX/Messages/SMXXXXXXXXXXXXXXXXXXXXXXXX/Media.json"} t
o: +4475XXXXXXXX uri: /2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXX/Messages/SMXXXXXXXXXXXXXXXXXXXXXXXX.json>
```

##FUTURE IMPROVEMENTS##
This software is just answering to the provided user stories and it can be improved. Moreover, I left something unfinished. In particular I would like to:
- arrive to a 100% test coverage. I arrived to 95%. What's missing is the unit test for the Message class, send_message method and the one for the related function of the place_order method in the takeaway class
- personalise the confirmation message, not only considering the time but also the price and, possibly, an order summary
- create the menu class without passing a pre established menu + add to it add_to_menu and remove_from_menu methods in order to populate the menu and make the menu class adaptable to different restaurants
- create a show_basket method in the take_away class for allowing customers to visualise their order status at any time
