Cloned from Makers Academy (source):
https://github.com/makersacademy/takeaway-challenge

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

Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
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
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.


Notes on Test Coverage
----------------------
You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.

All tests passed (100% Coverage)


DOMAIN MODEL
------------
Menu: display_menu, select_item, deselect_item, place_order
Order: order_item, remove_item, confirm_order
Verify: verify_order, send_delivery_confirmation
Printer: formatter


FEATURE TEST (IRB)
------------------

2.5.0 :001 > require './lib/menu'
 => true
2.5.0 :002 > require './lib/printer'
 => true
2.5.0 :003 > require './lib/order'
 => true
2.5.0 :004 > require './lib/verify'
 => true
2.5.0 :005 > menu = Menu.new(Printer.new, Order.new(Verify.new))
 => #<Menu:0x00007feffa391718 @printer=#<Printer:0x00007feffa391970 @title="DDs VEGERAMA", @split="----------------------------------------">, @order=#<Order:0x00007feffa391768 @verify=#<Verify:0x00007feffa3918a8 @client=#<Twilio::REST::Client:0x00007feffa391830 @username="AC5947896b6110bba62a8acb8acede7129", @password="8d6e8b2ca2bf060292e8a628e3dea0e1", @region=nil, @account_sid="AC5947896b6110bba62a8acb8acede7129", @auth_token="8d6e8b2ca2bf060292e8a628e3dea0e1", @auth=["AC5947896b6110bba62a8acb8acede7129", "8d6e8b2ca2bf060292e8a628e3dea0e1"], @http_client=#<Twilio::HTTP::Client:0x00007feffa391808 @proxy_addr=nil, @proxy_port=nil, @proxy_user=nil, @proxy_pass=nil, @ssl_ca_file=nil, @timeout=nil, @adapter=:net_http>, @accounts=nil, @api=nil, @chat=nil, @fax=nil, @ip_messaging=nil, @lookups=nil, @monitor=nil, @notify=nil, @preview=nil, @pricing=nil, @proxy=nil, @taskrouter=nil, @trunking=nil, @video=nil, @messaging=nil, @wireless=nil, @sync=nil, @studio=nil>>, @current_order=[], @order_price=0>, @menu=[{:item=>"Devil's Cauliflower", :price=>4}, {:item=>"Rainbow Pot", :price=>3}, {:item=>"Oreo Brownie", :price=>3}]>
2.5.0 :006 > menu.display_menu

              DDs VEGERAMA              
----------------------------------------
Devil's Cauliflower                    4
Rainbow Pot                            3
Oreo Brownie                           3



 => nil
2.5.0 :007 > menu.select_item("Oreo Brownie")
 => 3
2.5.0 :008 > menu.select_item("Rainbow Pot")
 => 6
2.5.0 :009 > menu.select_item("Devil's Cauliflower")
 => 10
2.5.0 :010 > menu.deselect_item("Rainbow Pot")
 => 7
2.5.0 :011 > menu.place_order



              DDs VEGERAMA              
----------------------------------------
Oreo Brownie                           3
Devil's Cauliflower                    4



TOTAL // £7


PLEASE CONFIRM YOUR ORDER AND TOTAL

Press Y to confirm / Press N to edit order
Y
 => "SM42ead1986adc494291ea6d7dc4405a8b" 
