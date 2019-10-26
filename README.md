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

* **WARNING** think twice before you push your mobile number or any private details to a public space like Github. Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.

==================
Sara Rancati - 26 October 2019

Step-by-step program development process:
-----
1. First user story: the requirements is for the user to be able to see a list of dishes with prices. I created a simple diagram with Menu (class), list (variable), view_list (method) and wrote the first test. The instance variable @list is not accessible outside of the class, but the list can be viewed by calling the view_list method:

```sh
2.5.0 :002 > mymenu = Menu.new
 => #<Menu:0x00007f884d04d1c0 @list={"rice"=>1.5, "fries"=>2.5, "noodles"=>3.5, "pasta"=>6.5, "pizza"=>7.5}>
2.5.0 :003 > mymenu.view_list
 => {"rice"=>1.5, "fries"=>2.5, "noodles"=>3.5, "pasta"=>6.5, "pizza"=>7.5}
```

2. Second user story: the user can select some number of several available dishes. This indicates that I'd need a method that requests the user's input several times for both the item and the quantity. I need to be able to store the user's selection in a basket that the user can view. For this, I created a second class (TakeAway). When initialized, the TakeAway object should have a property that generates a new Menu object. The menu's list will be assigned to an instance variable (@todays_dishes) through the view_list method being called on menu.

```sh
2.5.0 :002 > myTakeAway = TakeAway.new
 => #<TakeAway:0x00007fb16f09e8e0 @todays_dishes={"rice"=>1.5, "fries"=>2.5, "noodles"=>3.5, "pasta"=>6.5, "pizza"=>7.5}>
```

*First commit.*

There should also be a method in the TakeAway class that return the list of available dished (view_menu). I then worked on the test for the order method, which should return the user's input for each dish/quantity selected.

```sh
2.5.0 :002 > myTakeAway = TakeAway.new
 => #<TakeAway:0x00007fc73a190268 @todays_dishes={"rice"=>1.5, "fries"=>2.5, "noodles"=>3.5, "pasta"=>6.5, "pizza"=>7.5}>
2.5.0 :003 > myTakeAway.view_menu
 => {"rice"=>1.5, "fries"=>2.5, "noodles"=>3.5, "pasta"=>6.5, "pizza"=>7.5}
2.5.0 :004 > myTakeAway.order
Please enter the dish (to finish your order, hit return twice).
pizza
Please enter the quantity.
3
3 x pizza added
Please enter the dish (to finish your order, hit return twice).
pasta
Please enter the quantity.
2
2 x pasta added
Please enter the dish (to finish your order, hit return twice).

 => {"pizza"=>3, "pasta"=>2}
```

*Second commit.*

3. Third user story: the user would like to check that the total matches the subtotal for each item (this is my interpretation as instructions are not 100% clear to me - ideally I would have clarified with the client). I first created a test for the subtotal for each item. I then created a subtotal method and called that in the order method.

(same irb output as above plus below:)
```sh
2.5.0 :004 > myTakeAway.view_summary
 => "3 x pizza = £22.5; 2 x pasta = £13.0"
 ```

 *Third commit.*

 I then worked on the method to calculate the total (i.e. iterating over the basket hash and menu hash).

```sh
=> {"pizza"=>3, "pasta"=>2}
2.5.0 :004 > myTakeAway.total
=> "Total = £35.5"
 ```

 At this point I researched how to remove the need for inserting my input in the test each time, to try to stub out the standard input stream.

 *Fourth commit.*

 4. Fourth user story:
