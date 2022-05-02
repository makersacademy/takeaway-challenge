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

Student notes for coach:

Firstly, all credit for the idea of a hot smoothie goes to Jonathan Goldstein, Howard Chackowicz, and Wiretap in general.

1. I was unable to implement all the tests I wanted. You'll see that I couldn't test that calling the complete_order method instantiated
a new instance of SMS. I tried a couple of tests for this, but neither worked

2. I spent a while trying to prompt the user for input to confirm their order matched their total, as I thought this would be closer to how an app would actually work (albeit with clicking instead of typing) but despite some experiments with stubbing, I was unable to get RSpec to run without at least once prompting me for input, so I ditched this.

3. I *think* I got the stubbing to work for the twilio app. In any case, rspec runs the tests without sending a message and IRB is able to send a message to my phone.
However, when I tried to implement the last two tests (point 1), I did sometimes find that rspec would send out a text. I would be keen to understand this better, so any resources on stubbing and how to get my head around it would be much appreciated.

4. I also spent a while trying to find a good test for raising an error if an item was unavailable. As things stand, I guess I ended up
hardcoding the rspec, which isn't great if this were a real app and availability needed to be changed as the test would then fail. I couldn't work out how to use doubles to instantiate a double of an unavailable item and then use that to raise the error (assuming that is what I was
supposed to be doing). The only other thing I could think of would be to create a new class for each item for sale and then have a raise_error
if that item's 'available' method was set to false, but this seems really convoluted... I'm assuming there's a way to use doubles to simulate an unavailable item, but I didn't have any joy with this, so again a nudge in the right direction would be great.

5. Another idea for improvement would be to adjust stock levels. Ideally stock would be adjusted according to what was ordered, so that the available key would return an integer rather than a boolean, and once that integer was 0, it would raise an error. There could also be low availability warnings when stock levels fell below a certain number.

6. That's everything I can think of. If you'd like to see my diagramming for this exercise, it can be found here:  https://www.notion.so/Takeaway-Challenge-April-29-2022-4d2c57cfba8a4486981a71355c5c9a1b

How to install the program
------

1. Run git clone https://github.com/S-Spiegl/takeaway-challenge-new
3. If you don't have bundler already, run the command gem install bundler
2. Run bundle-install

How to use the program

-------

1. Navigate to the parent directory and open IRB
2. Enter: './lib/order.rb'
3. Create a new order (e.g. order = Order.new)
4. View the menu (e.g. order.view_menu)
5. Add items to your order using the order's  (e.g. order.add(1))
6. Check your total at any time (e.g. order.total)
7. Check your selection at any time (e.g. order.selection)
8. When you're ready to checkout, run order.checkout
9. Confirm that you're happy with your order and that it matches the total, then
run complete_order and provide your telephone number to receive a confirmation
(e.g order.complete_order(+1 23456 789 10123)
10. Enjoy!

How to test

-------

Run rspec


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
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) when you run your tests.
test
