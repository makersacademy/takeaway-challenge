
This is my first time making an app that allows user to receive a text through twillio. In this app, you are able to order a take away, from a menu (hash of dish and price) by specifying the quantity.
You can see a total every time you place one order, and when you finish, you can see the final order list with each quantity and total price. 
Then the program will make sure the calculation was correct, and if so it will send you an text saying that your order is going to be ready before the time that's an hour after you place an order. 

--interacting example in irb--
2.4.0 :001 > require './takeaway'
 => true
2.4.0 :002 > ta = Takeaway.new
 => #<Takeaway:0x007f838115e0f8 @menu={:seafood_ramen=>8.5, :vegetable_curry=>7, :prawn_noodles=>7.5, :fried_eggrice=>6, :tofu_udon=>5.5, :sardine_teriyaki=>6.5, :tempura_udon=>8}, @final_order=[], @total=0>
2.4.0 :003 > ta.menu
 => {:seafood_ramen=>8.5, :vegetable_curry=>7, :prawn_noodles=>7.5, :fried_eggrice=>6, :tofu_udon=>5.5, :sardine_teriyaki=>6.5, :tempura_udon=>8}
2.4.0 :004 > ta.order(:seafood_curry, 3)
RuntimeError: We do not have that dish here
  from /Users/chiakimizuta/gitDir/takeaway-challenge/lib/takeaway.rb:14:in `order'
  from (irb):4
  from /Users/chiakimizuta/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :005 > ta.order(:seafood_ramen, 2)
 => 17.0
2.4.0 :006 > ta.order(:tempura_udon, 1)
 => 25.0
2.4.0 :007 > ta.order(:sardine_teriyaky, 2)
RuntimeError: We do not have that dish here
  from /Users/chiakimizuta/gitDir/takeaway-challenge/lib/takeaway.rb:14:in `order'
  from (irb):7
  from /Users/chiakimizuta/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :008 > ta.order(:sardine_teriyaki, 2)
 => 38.0
2.4.0 :009 > ta.final_order
 => [{:dish=>:seafood_ramen, :quantity=>2}, {:dish=>:tempura_udon, :quantity=>1}, {:dish=>:sardine_teriyaki, :quantity=>2}]
2.4.0 :010 > ta.total
 => 38.0
2.4.0 :011 > ta.sum_correct?
 => true
2.4.0 :012 > ta.confirmation
 => <Twilio.Api.V2010.MessageInstance account_sid: ACc6ab8628503b6202c8a41c0af43b523d api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 18:18 date_created: 2018-03-04 17:18:37 +0000 date_updated: 2018-03-04 17:18:37 +0000 date_sent:  direction: outbound-api error_code: 0 error_message:  from: +447533025648 messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid: SM9545bb8be5dd4ecba40a9fd99b38e0f4 status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/ACc6ab8628503b6202c8a41c0af43b523d/Messages/SM9545bb8be5dd4ecba40a9fd99b38e0f4/Media.json"} to: +447428778796 uri: /2010-04-01/Accounts/ACc6ab8628503b6202c8a41c0af43b523d/Messages/SM9545bb8be5dd4ecba40a9fd99b38e0f4.json>   

*The last line (36) sent a text to my phone!




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
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
