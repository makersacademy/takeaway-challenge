Takeaway Challenge
==================
This is my proposed solution for the Makers Academy Weekend Challenge: Takeaway (week 2)

Setup
-------
1. Download this repository
2. Run 'bundle' in the command line to make sure all gems are installed

What is the program about?
-------
This is a program to order food to takeaway. The customer should be able to:
- See a menu with dishes and prices
- Select one or several dishes to orders
- See a summary of what they have ordered so far
- Check the current total price
- Place the final order and receive a confirmation via SMS with the estimate time of delivery

Approach to solve the challenge
-------
To solve this challenge, we have created three different classes:
- A TakeAway class, responsible for managing the customer's order (dish selection, order summary, etc.)
- A Menu class, responsible for storing the menu dishes and its prices
- An SmsSender class, responsible for sending a confirmation SMS to the customer

Feature test
-----
```
2.5.0 :001 > require './lib/sms_sender'
 => true
2.5.0 :002 > require './lib/menu'
 => true
2.5.0 :003 > require './lib/take_away'
 => true
2.5.0 :004 > takeaway = TakeAway.new
 => #<TakeAway:0x00007fc2edd0b788 @order_list=[], @menu=#<Menu:0x00007fc2edd0b710 @menu_list={:tortilla=>4, :gazpacho=>3, :pasta=>5, :pizza=>5, :lasagna=>6, :salad=>4, :coke=>2}>, @sms_sender=#<SmsSender:0x00007fc2edd0b648 @account_sid="AC84579b5711fe20c9d367832993b0d830", @auth_token="5afa537d06fc7069ab9f32e172ca1017", @client=#<Twilio::REST::Client:0x00007fc2edd0b508 @username="AC84579b5711fe20c9d367832993b0d830", @password="5afa537d06fc7069ab9f32e172ca1017", @region=nil, @account_sid="AC84579b5711fe20c9d367832993b0d830", @auth_token="5afa537d06fc7069ab9f32e172ca1017", @auth=["AC84579b5711fe20c9d367832993b0d830", "5afa537d06fc7069ab9f32e172ca1017"], @http_client=#<Twilio::HTTP::Client:0x00007fc2edd0b4e0 @proxy_addr=nil, @proxy_port=nil, @proxy_user=nil, @proxy_pass=nil, @ssl_ca_file=nil, @timeout=nil, @adapter=:net_http>, @accounts=nil, @api=nil, @chat=nil, @fax=nil, @ip_messaging=nil, @lookups=nil, @monitor=nil, @notify=nil, @preview=nil, @pricing=nil, @proxy=nil, @taskrouter=nil, @trunking=nil, @video=nil, @messaging=nil, @wireless=nil, @sync=nil, @studio=nil>, @from="+34955160758", @to="+34722420360">>
2.5.0 :005 > takeaway.display_menu
"Dish: tortilla, price: £4"
"Dish: gazpacho, price: £3"
"Dish: pasta, price: £5"
"Dish: pizza, price: £5"
"Dish: lasagna, price: £6"
"Dish: salad, price: £4"
"Dish: coke, price: £2"
 => {:tortilla=>4, :gazpacho=>3, :pasta=>5, :pizza=>5, :lasagna=>6, :salad=>4, :coke=>2}
2.5.0 :006 > takeaway.order_summary
You have not added anything yet
 => nil
2.5.0 :007 > takeaway.order(:pizza)
1 pizza has been added to your order list
 => nil
2.5.0 :008 > takeaway.order(:coke)
1 coke has been added to your order list
 => nil
2.5.0 :009 > takeaway.order(:lasagna, 2)
2 lasagnas have been added to your order list
 => nil
2.5.0 :010 > takeaway.order_summary
1 pizza(s), £5
1 coke(s), £2
2 lasagna(s), £12
 => [{:dish=>:pizza, :amount=>1, :price=>5}, {:dish=>:coke, :amount=>1, :price=>2}, {:dish=>:lasagna, :amount=>2, :price=>12}]
2.5.0 :011 > takeaway.print_total_price
The total price is £19.
 => nil
2.5.0 :012 > takeaway.place_order(20)
Traceback (most recent call last):
        3: from /Users/cristinamariaocanamanzano/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):13
        1: from /Users/cristinamariaocanamanzano/Desktop/Projects/week2/takeaway-challenge/lib/take_away.rb:39:in `place_order'
RuntimeError (The amount entered is incorrect)
2.5.0 :013 > takeaway.place_order(19)
Thanks for your order, you will receive a confirmation SMS within a few minutes
 => <Twilio.Api.V2010.MessageInstance account_sid: AC84579b5711fe20c9d367832993b0d830 api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 15:27. date_created: 2018-09-16 13:27:31 +0000 date_updated: 2018-09-16 13:27:31 +0000 date_sent:  direction: outbound-api error_code: 0 error_message:  from: +34955160758 messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid: SM6c3f6a957c0d465489dd05b978f2d885 status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/AC84579b5711fe20c9d367832993b0d830/Messages/SM6c3f6a957c0d465489dd05b978f2d885/Media.json"} to: +34722420360 uri: /2010-04-01/Accounts/AC84579b5711fe20c9d367832993b0d830/Messages/SM6c3f6a957c0d465489dd05b978f2d885.json>

```

Challenge instructions
-------

Full instructions [here](https://github.com/makersacademy/takeaway-challenge)

User Stories
-----

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
