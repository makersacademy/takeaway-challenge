Upon initializing a instance of the Restaurant class, a user is able to create orders and receive a text message to their phone upon completing their order. 

Users can also view a menu, and there are internal checks taken when an order is completed to ensure the total was correctly calculated.

I've included an exerpt of the code's functionality in irb below. In this script you can see the error message which arises when a user tries to order something not on the menu, and you can see how a user is able to add items to an order and complete the order which then sends a Twilio text to their phone. 

I was able to complete the functionality of the code to a good level, I had problems with the testing however and I need to look into how to properly test the SMS sending. I've added a fakesender which means that everytime Restaurant.complete_order is run on rspec you do not receive a text, however my testing is not extensive as I would like.

3.0.2 :007 > mcdonalds.add_items("sweets")
/Users/emmanuel/Projects/takeaway-challenge/lib/order.rb:41:in `dish_creator': This dish is not on the menu (RuntimeError)
        from /Users/emmanuel/Projects/takeaway-challenge/lib/order.rb:16:in `block in add_dish'
        from /Users/emmanuel/Projects/takeaway-challenge/lib/order.rb:15:in `times'
        from /Users/emmanuel/Projects/takeaway-challenge/lib/order.rb:15:in `add_dish'
        from /Users/emmanuel/Projects/takeaway-challenge/lib/restaurant.rb:29:in `add_items'
        from (irb):7:in `<main>'
        from /Users/emmanuel/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/emmanuel/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/emmanuel/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
 => 1 

3.0.2 :009 > mcdonalds.add_items("fries", 3)
 => 3 

3.0.2 :010 > mcdonalds.order
 => 
#<Order:0x0000000138ba79d8
 @dish=nil,
 @dish_class=Dish,
 @dishes=
  [#<Dish:0x000000011c82ea70 @name="burger", @price=4.99>,
   #<Dish:0x0000000138e7c2a8 @name="fries", @price=2.99>,
   #<Dish:0x0000000138e7c208 @name="fries", @price=2.99>,
   #<Dish:0x0000000138e7c168 @name="fries", @price=2.99>],
 @menu={:fries=>2.99, :burger=>4.99, :coke=>1.99, :fanta=>1.49, :pizza=>10.49, :lasagna=>5.99, :sprite=>1.49, :nachos=>3.49, :popcorn=>1.49},
 @total=13.96> 

3.0.2 :011 > mcdonalds.complete_order
 => <Twilio.Api.V2010.MessageInstance body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 22:45 num_segments: 1 direction: outbound-api from: +447897017954 to: [REDACTED] date_updated: 2021-10-03 20:45:28 +0000 price:  error_message:  uri: /2010-04-01/Accounts/AC89329d06bcc6a8d0c85b99f198937bc1/Messages/SMb4925b496a194bad81422495d59490e8.json account_sid: AC89329d06bcc6a8d0c85b99f198937bc1 num_media: 0 status: queued messaging_service_sid:  sid: SMb4925b496a194bad81422495d59490e8 date_sent:  date_created: 2021-10-03 20:45:28 +0000 error_code:  price_unit: USD api_version: 2010-04-01 subresource_uris: {"media"=>"/2010-04-01/Accounts/AC89329d06bcc6a8d0c85b99f198937bc1/Messages/SMb4925b496a194bad81422495d59490e8/Media.json"}>