```

[jihinip:~/Projects/takeaway-challenge]$ irb
2.5.0 :001 > require './lib/menu'
 => true
2.5.0 :002 > require './lib/order'
 => true
2.5.0 :004 > t=Order.new
 => #<Order:0x00007f8c6a376a88 @list=[], @menu=#<Menu:0x00007f8c6a376a38 @dish={"Tofu salad"=>2.5, "Miso soup"=>1.1, "Ming's wings"=>3.9, "Spaghetti"=>6.9, "Bag of Ducks"=>8.0, "Water from A Questionable Source"=>0.1}>, @message=nil, @client=#<Twilio::REST::Client:0x00007f8c6a376948 @username="ACf5d19af71627eddbd1e5d6871a088f6a", @password="9edeba7d3f3cec1fc0854c8e0312a9dd", @region=nil, @account_sid="ACf5d19af71627eddbd1e5d6871a088f6a", @auth_token="9edeba7d3f3cec1fc0854c8e0312a9dd", @auth=["ACf5d19af71627eddbd1e5d6871a088f6a", "9edeba7d3f3cec1fc0854c8e0312a9dd"], @http_client=#<Twilio::HTTP::Client:0x00007f8c6a376920 @proxy_addr=nil, @proxy_port=nil, @proxy_user=nil, @proxy_pass=nil, @ssl_ca_file=nil, @timeout=nil, @adapter=:net_http>, @accounts=nil, @api=nil, @chat=nil, @fax=nil, @ip_messaging=nil, @lookups=nil, @monitor=nil, @notify=nil, @preview=nil, @pricing=nil, @proxy=nil, @taskrouter=nil, @trunking=nil, @video=nil, @messaging=nil, @wireless=nil, @sync=nil, @studio=nil>>

2.5.0 :005 > t.add("Tofu salad", 3)
(x3) Tofu salad added to basket.
 => nil

2.5.0 :006 > t.add("Spaghetti", 2)
(x2) Spaghetti added to basket.
 => nil

2.5.0 :007 > t.add("Water from A Questionable Source", 4)
(x4) Water from A Questionable Source added to basket.
 => nil

2.5.0 :008 > t.add("Bag of Ducks", 2)
(x2) Bag of Ducks added to basket.
 => nil

2.5.0 :009 > t.total
"The total is £37.7"
 => 37.7

2.5.0 :010 > t.finalise
"The total is £37.7"
 => <Twilio.Api.V2010.MessageInstance account_sid: ACf5d19af71627eddbd1e5d6871a088f6a api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 00:00. date_created: 2018-04-02 22:00:18 +0000 date_updated: 2018-04-02 22:00:18 +0000 date_sent:  direction: outbound-api error_code: 0 error_message:  from: +441733530297 messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid: SM88b6ca638436457580ae7851e4415f1f status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/ACf5d19af71627eddbd1e5d6871a088f6a/Messages/SM88b6ca638436457580ae7851e4415f1f/Media.json"} to: +447828003315 uri: /2010-04-01/Accounts/ACf5d19af71627eddbd1e5d6871a088f6a/Messages/SM88b6ca638436457580ae7851e4415f1f.json>

```

# Takeaway Challenge!

## Understanding user story, domain modelling:

#### Verbs (Actions):
* place order
* select dishes
* check total
* send text

#### Nouns (things):
* customer
* order
  * list of dishes
  * total cost
* dishes
  * prices
  * quantity

Objects    |    Messages
------------------- | -------------------
order | add and remove dishes, call on totaller to calculate total
printer | print menu, print current order, print total
menu?? | hold prices and item info
totaller | takes order, sum of dishes
texter | takes order, sends text
script | prints menu, ask for order, prints total, activate texter etc


#### Creating a basic structure

Looking at the rough plan I have made above, I decided that the menu should use an instance variable that holds a hash of dishes and their corresponding prices.

The idea is that calling the key by the string name should be able to add it to an array in an instantiated instance of Order. This is quite an unrefined way of doing things, but I want to try to get the Twilio API integration working.

#### Creating a menu

The menu is a simple class that initialises with a hash with the dish names as strings and the prices as floats.

#### Fleshing out the Order class

Following the instructions, I implemented the add method in the Order class.
The total method took some thinking, and in the end I looked into the rubric for some tips on how to implement this. Initially I wanted to use a hash holding the item and quantity, but the rubric pointed towards an array that simply stores multiple strings of the same order if need be.

#### Implementing Twilio

This proved harder than I expected. I used one method to create the message to be sent via Twilio, and another method that holds the Twilio activation code. It took some juggling around with the spec test and the code to get everything working the way I wanted.

#### Things to keep in mind

I need to stick closer to the modelling that I did at the beginning. As soon as I was aware that the implementation of the API was harder than I expected, I lost sight of the plan I had with trying to keep with the single responsibility principle.
