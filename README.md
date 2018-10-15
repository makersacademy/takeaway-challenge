My Approach
=================

- Think about the nouns in the user stories and how they might become my classes (Dish, Menu, Order, Text)
- Start with Dish (because, it was a thing within a menu, which is a thing you need to order, which is what you need to complete to get a text ==> used this to create my classes in this order)
- Wrote tests first
-Initially started with a confirmation that would allow a user to enter their number, but cannot get it to work as says there is no 'to' number (even when my number was the default 'to' number) <-- FIX THIS
- Haven't figured out yet how to delete individual items from basket - you can see commented out attempt with a default amount of 1 being deleted per dish per time
- Used the twilio website to sign up and get a number which could then be messaged, though it was tricky to figure out how this could be tested --> ended up downloading the VCR gem to test


Instructions for Use
=================
        Chloes-MBP:takeaway-challenge chloeverity$ irb
        2.5.0 :001 > require './lib/text.rb'
         => true
        2.5.0 :002 > beeflomein = Dish.new("Beef Lo Mein", 12)
         => #<Dish:0x00007faade1a1590 @dish_name="Beef Lo Mein", @price=12>
        2.5.0 :003 > kungpaochicken = Dish.new("Kung Pao Chicken", 10)
         => #<Dish:0x00007faade17ded8 @dish_name="Kung Pao Chicken", @price=10>
        2.5.0 :004 > shanghaidumplings = Dish.new("Shanghai Dumplings", 6)
         => #<Dish:0x00007faae181a2c0 @dish_name="Shanghai Dumplings", @price=6>
        2.5.0 :005 > chasiuporkbun = Dish.new("Cha Siu Pork Bun", 4)
         => #<Dish:0x00007faadea02ae0 @dish_name="Cha Siu Pork Bun", @price=4>
        2.5.0 :006 > broccoliandbeansprouts = Dish.new("Broccoli and Beansprouts", 3)
         => #<Dish:0x00007faade9be9d0 @dish_name="Broccoli and Beansprouts", @price=3>
        2.5.0 :007 > saltandpeppersquid = Dish.new("Salt and Pepper Squid", 9)
         => #<Dish:0x00007faade9816c0 @dish_name="Salt and Pepper Squid", @price=9>
        2.5.0 :008 > menu = Menu.new([saltandpeppersquid, broccoliandbeansprouts, chasiuporkbun, shanghaidumplings,     kungpaochicken, bee
        flomein])
         => #<Menu:0x00007faade8e6300 @dishes=[#<Dish:0x00007faade9816c0 @dish_name="Salt and Pepper Squid", @price=9>, #<Dish:0x00007f
        aade9be9d0 @dish_name="Broccoli and Beansprouts", @price=3>, #<Dish:0x00007faadea02ae0 @dish_name="Cha Siu Pork Bun", @price=4>
        , #<Dish:0x00007faae181a2c0 @dish_name="Shanghai Dumplings", @price=6>, #<Dish:0x00007faade17ded8 @dish_name="Kung Pao Chicken"
        , @price=10>, #<Dish:0x00007faade1a1590 @dish_name="Beef Lo Mein", @price=12>]>
        2.5.0 :009 > order = Order.new(menu)
         => #<Order:0x00007faadeb1c750 @menu=#<Menu:0x00007faade8e6300 @dishes=[#<Dish:0x00007faade9816c0 @dish_name="Salt and Pepper S
        quid", @price=9>, #<Dish:0x00007faade9be9d0 @dish_name="Broccoli and Beansprouts", @price=3>, #<Dish:0x00007faadea02ae0 @dish_n
        ame="Cha Siu Pork Bun", @price=4>, #<Dish:0x00007faae181a2c0 @dish_name="Shanghai Dumplings", @price=6>, #<Dish:0x00007faade17d
        ed8 @dish_name="Kung Pao Chicken", @price=10>, #<Dish:0x00007faade1a1590 @dish_name="Beef Lo Mein", @price=12>]>, @basket=[]>
        2.5.0 :010 > order.add(saltandpeppersquid, 3)
         => [{:dish=>#<Dish:0x00007faade9816c0 @dish_name="Salt and Pepper Squid", @price=9>, :amount=>3}]
        2.5.0 :011 > order.add(chasiuporkbun, 2)
         => [{:dish=>#<Dish:0x00007faade9816c0 @dish_name="Salt and Pepper Squid", @price=9>, :amount=>3}, {:dish=>#<Dish:0x00007faadea
        02ae0 @dish_name="Cha Siu Pork Bun", @price=4>, :amount=>2}]
        2.5.0 :012 > order.add(beeflomein)
        => [{:dish=>#<Dish:0x00007faade9816c0 @dish_name="Salt and Pepper Squid", @price=9>, :amount=>3}, {:dish=>#<Dish:0x00007faadea
        02ae0 @dish_name="Cha Siu Pork Bun", @price=4>, :amount=>2}, {:dish=>#<Dish:0x00007faade1a1590 @dish_name="Beef Lo Mein", @pric
        e=12>, :amount=>1}]
        2.5.0 :013 > order.check_total(10)
        Traceback (most recent call last):
                3: from /Users/chloeverity/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
                2: from (irb):13
                1: from /Users/chloeverity/Projects/takeaway-challenge/takeaway-challenge/lib/order.rb:47:in `check_total'
                RuntimeError (Sorry, your total is £47, not £10)
                2.5.0 :014 > order.total
                 => 47
                2.5.0 :015 > order.confirm
                 => #<Text:0x00007faadea56050 @time="17:28", @send_sms=<Twilio.Api.V2010.MessageInstance account_sid: AC33738fa4d68c2290ddf1aad
                512d2eb28 api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you, Your order will be delivered before 17
                :28 date_created: 2018-10-14 15:28:00 +0000 date_updated: 2018-10-14 15:28:00 +0000 date_sent:  direction: outbound-api error_c
                ode: 0 error_message:  from: +441698313045 messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid:
                 SM8c29086703884b86b735f591dbbbe8d2 status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/AC33738fa4d68c2290ddf1aad5
                12d2eb28/Messages/SM8c29086703884b86b735f591dbbbe8d2/Media.json"} to: +447912210220 uri: /2010-04-01/Accounts/AC33738fa4d68c229
                0ddf1aad512d2eb28/Messages/SM8c29086703884b86b735f591dbbbe8d2.json>>
                2.5.0 :016 > exit

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
