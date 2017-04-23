Takeaway Challenge
==================

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

My approach to the Takeaway challenge (user stories, instructions and resources
bellow):
1. Domain model based on user stories: I need a Menu class that can print a menu,
can place an order, checks of the total sum is correct, sends and sms to confirm the order

2. I created a constant LIST_OF_DISHES, a hash of dishes and prices

3. I added simple print method, that prints the menu and price - in rspec, it is  
expected to print a constant.

4. I added a select method with 3 arguments - a dish from the menu,
how many times the dish needs to be added, and a total. Dishes go into an array of dishes, quantities go into an array of numbers. The method puts the two arrays into a hash called order, which is an instance variable of the Menu class. In Rspec, I tested if a hardcoded order (a hash) has its keys (dishes) included in the LIST_OF_DISHES.

5. The select method fails if the added dish is not in the menu.

6. For user story 3, I added a correct_total method, adding all dishes in the
order multiplied by the number of items.

7. For the same story, I added a method checkout, which fails if the total sum is wrong and moves on if the total sum is correct.

8. By 'moves on', I meant, it sends a text message. I created a Twilio account, which gave me a number from which to send text messages and the code allowing me to send a text using my account credentials and my Twilio number.

9. Initially I tried to have a send text method within my Menu class, but it had too many dependencies and I was getting too many errors. Also, menus don't really send you text messages, so here's to SRP. I made a new class Textsms, which only has one method, namely the send(text) method.

10. I modified the send method in the Textsms class so it takes an argument (the Twilio code had no arg and the body was hardcoded in the method). Then I added an
@sms (initalized with a new Textsms instance) instance variable to the Menu class and within the checkout method I called sms.send(text).

Here's how to use it in irb:
```
2.4.0 :001 > require './lib/menu'
 => true
2.4.0 :002 > menu=Menu.new
 => #<Menu:0x007f896cbb3468 @order={}, @total=0, @dishes=[], @quants=[], @sms=#<Textsms:0x007f896cbb3080>>
2.4.0 :003 > menu.print
 => {"formule1"=>10, "formule2"=>15, "formule3"=>20, "drink"=>5}
2.4.0 :004 > menu.select('drink', 2, 10)
drink was added 2 time(s)! Select again if you want to add more
 => 10
2.4.0 :005 > menu.select('drink', 1, 4)
drink was added 1 time(s)! Select again if you want to add more
 => 14
2.4.0 :006 > menu.select('drinksssssss', 1, 4)
RuntimeError: Dish not in the menu, try again!
2.4.0 :007 > menu.checkout
RuntimeError: The sum is incorrect!
2.4.0 :009 > menu.select('drink', 1, 6)
drink was added 1 time(s)! Select again if you want to add more
 => 20
2.4.0 :010 > menu.checkout
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/ACfa9b631a7443203be5289bdefa1522b2/Messages/SMd58b2f24e7f84da0ad8b30f49a434202>
2.4.0 :011 >
 ```

 Limitations: when you put in the incorrect total, you cannot correct it unless you calculate your total correct sum and then select something with a wrong total again, so that the final total is correct. 
________________________________________________________________________
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
