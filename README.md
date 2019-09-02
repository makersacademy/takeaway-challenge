Takeaway Challenge

Introduction
-------

This application allows handlling takeaway orders via text message. It sends a
list of dishes with prices following request. It receives order via text message
and sends confirmation if order is placed successfully.

Instructions
-------
The text handling function has been implemented using Twilio API. To use this function the account sid, auth token, Twilio number and mobile number need to be updated.

To use the application, load 'takeaway.rb' in irb, initialize it with default
arguments, and load default menu by calling load_default_dishes:
```
2.5.0 :001 > require './lib/takeaway'
 => true
2.5.0 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x00007fae4365ca40 @menu=#<Menu:0x00007fae4365ca18 @dishes=[]>, @sms_formatter=#<SmsFormatter:0x00007fae4365c9c8>, @sms=#<SendSms:0x00007fae4365c9a0>, @order_class=Order>
2.5.0 :003 > takeaway.load_default_dishes
 => [#<Dish:0x00007fae4295e4b0 @name="Spring roll", @price=4.8>, #<Dish:0x00007fae4295e460 @name="Dumplings", @price=5.6>, #<Dish:0x00007fae4295e410 @name="Greek pie", @price=12.0>]
```

By passing 'menu' to handle_sms method, which stimulates receiving text instruction, a text message containing a list of dishes and prices will be sent out.
```
2.5.0 :004 > takeaway.handle_sms('menu')
 => <Twilio.Api.V2010.MessageInstance account_sid: *** api_version: 2010-04-01 body: Sent from your Twilio trial account - Menu:
Spring roll: 4.8
Dumplings: 5.6
Greek pie: 12.0
```

Order can be placed by passing arugument to handle_sms in the format of:
Dish 1, quantity  
Dish 2, quantity  
Price: price  

It raises error if any dish is not in menu:
```
2.5.0 :008 > takeaway.handle_sms("Spring rolls, 2\nPizza, 3\nPrice: 10")
Traceback (most recent call last):
        5: from /Users/xiaofeizhang/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        4: from (irb):8
        3: from /Users/xiaofeizhang/Projects/takeaway-challenge/lib/takeaway.rb:33:in `handle_sms'
        2: from /Users/xiaofeizhang/Projects/takeaway-challenge/lib/takeaway.rb:48:in `handle_sms_order'
        1: from /Users/xiaofeizhang/Projects/takeaway-challenge/lib/order.rb:14:in `valid'
RuntimeError (Dish not in menu)
```

It raises error if price in order does not match sum for dishes ordered:
```
2.5.0 :010 > takeaway.handle_sms("Dumplings, 2\nGreek pie, 1\nPrice: 20")
Traceback (most recent call last):
        5: from /Users/xiaofeizhang/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        4: from (irb):10
        3: from /Users/xiaofeizhang/Projects/takeaway-challenge/lib/takeaway.rb:33:in `handle_sms'
        2: from /Users/xiaofeizhang/Projects/takeaway-challenge/lib/takeaway.rb:48:in `handle_sms_order'
        1: from /Users/xiaofeizhang/Projects/takeaway-challenge/lib/order.rb:16:in `valid'
RuntimeError (Price does not match)
```

It sends confirmation for an valid order:
```
2.5.0 :011 > takeaway.handle_sms("Dumplings, 2\nGreek pie, 1\nPrice: 23.2")
 => <Twilio.Api.V2010.MessageInstance account_sid: *** api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered in one hour.
```
