Takeaway Challenge
==================

## Progress update
User story status:
- [x] I would like to see a list of dishes with prices
- [x] I would like to be able to select some number of several available dishes
- [ ] I would like to check that the total I have been given matches the sum of the various dishes in my order
- [x] I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

## Comments on approach
I had limited time this weekend and then spent too long trying to get my head around mocking.
Rather than using the rest of the time working on hashes to get a subtotal etc I thought it would be best to focus on the twillio api to get a functioning text message service.

This was quite a struggle and involved fathoming out how to use ENV variables and the API with test numbers. In the end I looked to others to see how to wrap the Twilio API into a class [MSchmidt19](https://github.com/Mschmidt19/takeaway-challenge) and [SimoneSmith](https://github.com/simone-smith/takeaway-challenge).

## IRB Test

Here's the [IRB test text](https://github.com/Whatapalaver/takeaway-challenge/blob/master/spec/features/irb_test.txt) file:

```
 irb                                                                                                                             ✔  17:17:16
2.5.0 :001 > require './lib/restaurant'
 => true
2.5.0 :002 > cafe = Restaurant.new
 => #<Restaurant:0x00007fb25950da08 @menu=#<Menu:0x00007fb25950d9e0 @starters={"poppadoms"=>0.99, "chutney"=>0.55, "chana dal"=>4.99, "secret samosa"=>2.5}, @mains={"tikka masala"=>7.5, "rogan josh"=>7.89, "saag aloo"=>5.45}, @full_menu={"poppadoms"=>0.99, "chutney"=>0.55, "chana dal"=>4.99, "secret samosa"=>2.5, "tikka masala"=>7.5, "rogan josh"=>7.89, "saag aloo"=>5.45}>, @order=#<Order:0x00007fb25950d940 @menu=#<Menu:0x00007fb25950d9e0 @starters={"poppadoms"=>0.99, "chutney"=>0.55, "chana dal"=>4.99, "secret samosa"=>2.5}, @mains={"tikka masala"=>7.5, "rogan josh"=>7.89, "saag aloo"=>5.45}, @full_menu={"poppadoms"=>0.99, "chutney"=>0.55, "chana dal"=>4.99, "secret samosa"=>2.5, "tikka masala"=>7.5, "rogan josh"=>7.89, "saag aloo"=>5.45}>, @basket=[], @total=0>>
2.5.0 :003 > cafe.select("poppadoms")
 => ["poppadoms"]
2.5.0 :004 > cafe.select("secret samosa")
 => ["poppadoms", "secret samosa"]
2.5.0 :005 > cafe.select("saag aloo")
 => ["poppadoms", "secret samosa", "saag aloo"]
2.5.0 :006 > cafe.show_basket
 => ["poppadoms", "secret samosa", "saag aloo"]
2.5.0 :007 > cafe.delete("saag aloo")
 => "saag aloo"
2.5.0 :008 > cafe.show_basket
 => ["poppadoms", "secret samosa"]
2.5.0 :010 > cafe.complete_order
SMb99448302c0947989e6df2fcd588d239
```
## Outstanding tasks

I haven't completed user story 3 so need to work through the totalling of the order.
I haven't amended the call to the twilio API to take a custom message body either.

Takeaway Challenge - Original README
====================================
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
