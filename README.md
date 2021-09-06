# Mabon ap Gwyn's submission of Week 2's Takeaway Challenge

I decided to tackle the user stories using a TDD approach. Dishes are stored in 'dishes.csv' and are loaded into a Menu object's attribute upon instantiation. Menu object creation is linked to a Restaurant's instantiation. When initializing an Order instance, it is passed the Restaurant object as an argument allowing the menu to be viewed via calling on one of the Restaurant's attibutes within the Order class. A finalised order is then passed to the Restaurant object for confirmation.

## How to run

* clone the repository `git clone https://github.com/Maby0/takeaway-challenge.git`
* launch IRB from the cloned directory, passing the order.rb file `irb -r './lib/order'`
* instantiate a new Restaurant object and assign it a variable `your_restaurant = Restaurant.new`
* instantiate a new Order object, pass it your previously created Restaurant as an argument and assign it a variable `order = Order.new(your_restaurant)`
* call methods #view_menu, #add_to_order(dish_number), #remove_from_order(dish_number), #total on your Order instance to build your desired order `order.add_to_order(2)`
* pass the final order to your restaurant `order.send_order_to_restaurant`
* restaurant can then view the order and finalise it `your_restaurant.order` `your_restaurant.confirm_order`
* once you have configured your own environment variables in the twilio.rb, calling the method #confirm_order on the Restaurant object will trigger a confirmation text message to be sent using Twilio API.



A total of 11 RSpec tests were written which successfully covered 100% of the codebase. A Rubocop inspection was also ran on the code with zero offenses detected.

```
Student@MA123 takeaway-challenge % rspec

Menu
  loads 10 dishes on initialization
  :list returns menu items

Order
  is able to view the menu
  is able to add to :current_order
  is able to remove from :current_order
  notifies if specified dish is not in :current_order
  is able to view total price
  is able to send an order to restaurant

Restaurant
  is able to be passed an order
  raises error when confirming order without receiving one
  notifies when order has been submitted

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.03888 seconds (files took 0.2133 seconds to load)
11 examples, 0 failures


COVERAGE: 100.00% -- 101/101 lines in 6 files

Student@MA123 takeaway-challenge % rubocop
Inspecting 9 files
.........

9 files inspected, no offenses detected
```


Challenge details are outlined below.


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
