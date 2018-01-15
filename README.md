Takeaway Challenge
==================

This was a Makers Academy weekend challenge to design code that allowed the user to order food from a menu and receive an order confirmation via text message using the Twilio API.

The user stories implemented are as follows:

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

Here is an example of how you might interact with the code from the command line:

```
2.4.1 :011 > require './lib/restaurant.rb'
 => false
2.4.1 :012 > r = Restaurant.new
 => #<Restaurant:0x007fad4a357240 @menu=#<Menu:0x007fad4a357218>, @order=#<Order:0x007fad4a3571f0 @basket={}, @menu=#<Menu:0x007fad4a357218>, @prices=[]>>
2.4.1 :013 > r.menu.view
 => [{:name=>"green curry", :price=>8.0}, {:name=>"red curry", :price=>8.0}, {:name=>"pad thai", :price=>7.0}, {:name=>"massaman curry", :price=>9.0}, {:name=>"satay chicken", :price=>8.0}, {:name=>"beef panang", :price=>8.0}, {:name=>"massaman curry", :price=>9.0}, {:name=>"fried rice", :price=>5.0}, {:name=>"special fried rice", :price=>6.0}, {:name=>"sticky rice", :price=>5.0}, {:name=>"tempura", :price=>3.0}, {:name=>"crab cakes", :price=>5.0}]
2.4.1 :014 > r.order.add_item("sticky rice", 2)
 => "2 x sticky rice(s) added to your basket"
2.4.1 :015 > r.order.add_item("sticky rice", 2)
 => "2 x sticky rice(s) added to your basket"
2.4.1 :016 > r.order.view_basket
"sticky rice x 4 = £20.0"
 => {"sticky rice"=>4}
2.4.1 :017 > r.order.add_item("massaman curry", 2)
 => "2 x massaman curry(s) added to your basket"
2.4.1 :018 > r.order.view_basket
"sticky rice x 4 = £20.0"
"massaman curry x 2 = £18.0"
 => {"sticky rice"=>4, "massaman curry"=>2}
2.4.1 :019 > r.order.total
 => "Total: £38.0"
2.4.1 :020 > r.complete_order(28.0)
RuntimeError: your total of £28.0 does not match the calculated sum of £38.0
	from /Users/EdPerkins/Projects/takeaway-challenge/lib/restaurant.rb:21:in `complete_order'
	from (irb):20
	from /Users/EdPerkins/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
2.4.1 :021 > r.complete_order(38.0)
 => <Twilio.Api.V2010.MessageInstance account_sid: ACd052e2398bbf75bb0be6b4633acea1fc api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you! Your food order of £38.0 will be delivered before 22.31 date_created: 2018-01-14 21:46:14 +0000 date_updated: 2018-01-14 21:46:14 +0000 date_sent:  direction: outbound-api error_code: 0 error_message:  from: +441694352044 messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid: SM48d872e429d4433880b9458b0268bd1a status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/ACd052e2398bbf75bb0be6b4633acea1fc/Messages/SM48d872e429d4433880b9458b0268bd1a/Media.json"} to: +447801732952 uri: /2010-04-01/Accounts/ACd052e2398bbf75bb0be6b4633acea1fc/Messages/SM48d872e429d4433880b9458b0268bd1a.json>
 ```
