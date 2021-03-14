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

## Max's README

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

https://miro.com/app/board/o9J_lQciVi4=/

**irb output**

2.6.5 :001 > require './lib/order'
 => true
2.6.5 :002 > require './lib/text.rb'
=> true
2.6.5 :003 > require './lib/restaurant.rb'
 => true
2.6.5 :004 > require './lib/dishes.rb'
 => true

2.6.5 :005 > maxs_mexican_shack = Restaurant.new
 => #<Restaurant:0x00007f83f4a8a708 @dishes=#<Dishes:0x00007f83f4a8a438 @menu=nil>, @order=#<Order:0x00007f83f4a8a6e0 @whole_order=[], @
total=[], @dishes=#<Dishes:0x00007f83f4a8a668 @menu=nil>>, @text=#<Text:0x00007f83f4a8a640 @client=#<Twilio::REST::Client:0x00007f83f4a8
a5c8 @username="ACeb1afeaa145764290dd295ca81c7d9f0", @password="79e40e410358ccc57e321fda389ee3b0", @region=nil, @edge=nil, @account_sid=
"ACeb1afeaa145764290dd295ca81c7d9f0", @auth_token="79e40e410358ccc57e321fda389ee3b0", @auth=["ACeb1afeaa145764290dd295ca81c7d9f0", "79e4
0e410358ccc57e321fda389ee3b0"], @http_client=#<Twilio::HTTP::Client:0x00007f83f4a8a4d8 @proxy_prot=nil, @ssl_ca_file=nil, @timeout=nil,
@adapter=:net_http>, @logger=nil, @accounts=nil, @api=nil, @autopilot=nil, @chat=nil, @conversations=nil, @events=nil, @fax=nil, @flex_a
pi=nil, @insights=nil, @ip_messaging=nil, @lookups=nil, @messaging=nil, @monitor=nil, @notify=nil, @numbers=nil, @preview=nil, @pricing=
nil, @proxy=nil, @serverless=nil, @studio=nil, @sync=nil, @taskrouter=nil, @trunking=nil, @trusthub=nil, @verify=nil, @video=nil, @voice
=nil, @wireless=nil, @supersim=nil, @bulkexports=nil>, @account_sid="ACeb1afeaa145764290dd295ca81c7d9f0", @auth_token="79e40e410358ccc57
e321fda389ee3b0">>

2.6.5 :006 > maxs_mexican_shack.list_dishes
Item: MexiCali Beef Burger -----> Price: 12
Item: The Burrito Burger -----> Price: 15
Item: El No Beef Burger -----> Price: 15
Item: Los' Tres Bean Burger -----> Price: 11
Item: Magic Bean Burger -----> Price: 11
Item: Mexican Chik'n Burger -----> Price: 15
Item: Stanky Fries -----> Price: 7
Item: Nachos Libres -----> Price: 9
 => {"MexiCali Beef Burger"=>12, "The Burrito Burger"=>15, "El No Beef Burger"=>15, "Los' Tres Bean Burger"=>11, "Magic Bean Burger"=>11
, "Mexican Chik'n Burger"=>15, "Stanky Fries"=>7, "Nachos Libres"=>9}
2.6.5 :007 > maxs_mexican_shack.place_order
Enter item off menu, when done type end order
The Burrito Burger
El No Beef Burger
Stanky Fries
end order
 => ["The Burrito Burger ---> 15", "El No Beef Burger ---> 15", "Stanky Fries ---> 7"]
2.6.5 :008 > maxs_mexican_shack.bill
            The Burrito Burger ---> 15
            El No Beef Burger ---> 15
               Stanky Fries ---> 7
                   ------------
                        37
 => nil
2.6.5 :009 > maxs_mexican_shack.send_text
 => <Twilio.Api.V2010.MessageInstance body: Sent from your Twilio trial account - Thank you! Your order has been placed
      and will be delivered before 04:08 PM num_segments: 1 direction: outbound-api from: +18186415489 to: +447753410267 date_updated: 2
021-03-14 15:08:37 +0000 price:  error_message:  uri: /2010-04-01/Accounts/ACeb1afeaa145764290dd295ca81c7d9f0/Messages/SMa3bc738775c94cf
19a870a9e8fdc0774.json account_sid: ACeb1afeaa145764290dd295ca81c7d9f0 num_media: 0 status: queued messaging_service_sid:  sid: SMa3bc73
8775c94cf19a870a9e8fdc0774 date_sent:  date_created: 2021-03-14 15:08:37 +0000 error_code:  price_unit: USD api_version: 2010-04-01 subr
esource_uris: {"media"=>"/2010-04-01/Accounts/ACeb1afeaa145764290dd295ca81c7d9f0/Messages/SMa3bc738775c94cf19a870a9e8fdc0774/Media.json"
}>

**RSpec**

Finished in 0.05758 seconds (files took 1.26 seconds to load)

12 examples, 0 failures


COVERAGE:  97.62% -- 123/126 lines in 8 files

+----------+-------------+-------+--------+-----------+
| coverage | file        | lines | missed | missing   |
+----------+-------------+-------+--------+-----------+
|  75.00%  | lib/text.rb | 12    | 3      | 12, 22-23 |
+----------+-------------+-------+--------+-----------+
7 file(s) with 100% coverage not shown

**Learns**

If i had more time I would do the following:

- Refactor Text to get 100% test coverage
- Parse the user input to ensure it matches a menu item regardless of the case
- Refactor the dishes hash to contain information on the dishes, allergens, prep-time
and descriptions
- I would also like the customer to be able to select which part of the menu they would
like to view (mains, sides, drinks etc)

## Maker's Instructions

Instructions
-------

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * The text should state that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

> :warning: **WARNING:** think twice before you push your **mobile number** or **Twilio API Key** to a public space like GitHub :eyes:
>
> :key: Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
