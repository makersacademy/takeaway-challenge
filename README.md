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

Introduction
-------

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems

* Weekend challenge implementing the following user stories

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

Approach to the task
----

The basis of the program is to have an Order class that is separate (not called on initialization) from the Takeaway class. From the order object, the user has the following methods available

- show_menu - shows all the dishes avaialble
- add_to_basket(item, quantity) - allows to add dishes, and quantity
- remove(item) - remove item from basket **not yet implemented**
- summary - provides the user with a printed summary of the basket and current total.

Once an order is complete the order can then be submitted to the Takeaway objec with the following method. The exact amount on the order must be tendered for the order to be submitted.

- submit_order(order, tendered)

The idea behind keeping the order objects separate is that multiple incomplete Order objects can be open at a given time, and the Takeaway object only knows about an Order when it is submitted

Menu items are loaded to the menu object from a csv file names 'dishes.rb'

Notes to reviewers
----

Due to limited time the following could not be complete

- Method for users to remove items from basket (and tests)
- Order class has probably got too big, perhaps a 'basket' class could be extracted?
- Not sure how to properly TDD the STDOUT code
- Need to test/have error handling for invalid selections when adding to the basket
- In the menu class dishes which comprise the menu are imported from csv, need advice on how to TDD this
- Text class needs testing, need to figure out how to do this (seen that there is some advice in the rubric - ran out of time to implement)

Prerequisites
----

For the text confirmation functionality to work, a Twilio account must be set up and the following local environment variables must be set up

````
export TWILIO_ACCOUNT_SID=[your twilio account sid]
export TWILIO_AUTH_TOKEN=[your twilio token]
export TWILIO_TEL_NUMBER=[twilio number that the message is sent from]
export TEL_NUM=[your mobile number]
````


Example usage
----

The project is loaded into irb as follows

````
$ irb -r './lib/takeaway.rb' 
````

Once loaded in, a Takeaway object and order object can be created

````

2.6.5 :002 > t = Takeaway.new
 => #<Takeaway:0x00007f9569c903a0 @menu=#<Menu:0x00007f9569c90378 @dishes=[]>, @order_history=[]> 
2.6.5 :003 > 
2.6.5 :004 > order1 = Order.new
 => #<Order:0x00007f9569c78390 @menu=#<Menu:0x00007f9569c78340 @dishes=[]>, @basket=[]> 
2.6.5 :005 > 

````

For choices available, the menu can be viewed

````

2.6.5 :006 > order1.show_menu
1.  Sweet & Sour Chicken Balls    5.99
2.  Crispy Duck Spring Rolls (4)    4.99
3.  Chicken Dim Sum    6.49
4.  Szechuan Chicken in Garlic Chilli Sauce    5.99
5.  Kung Po Prawn Balls    7.99
6.  Stir Fried Mixed Vegetables in Black Bean Sauce    4.99
7.  Special Fried Rice    6.99
8.  Egg Fried Rice    3.99

````

Any number of the available items can be added to the basket

````

2.6.5 :009 > order1.add_to_basket(3)
 => [[{:dish=>"Chicken Dim Sum", :unit_price=>6.49, :id=>3}, 1]] 
2.6.5 :010 > order1.add_to_basket(4,2)
 => [[{:dish=>"Chicken Dim Sum", :unit_price=>6.49, :id=>3}, 1], [{:dish=>"Szechuan Chicken in Garlic Chilli Sauce", :unit_price=>5.99, :id=>4}, 2]] 
2.6.5 :011 > order1.add_to_basket(6)
 => [[{:dish=>"Chicken Dim Sum", :unit_price=>6.49, :id=>3}, 1], [{:dish=>"Szechuan Chicken in Garlic Chilli Sauce", :unit_price=>5.99, :id=>4}, 2], [{:dish=>"Stir Fried Mixed Vegetables in Black Bean Sauce", :unit_price=>4.99, :id=>6}, 1]] 
2.6.5 :012 > 

````

To view a summary of the order:

````
2.6.5 :014 > order1.summary
---------------
ORDER SUMMARY
---------------
1 x Chicken Dim Sum (£6.49 each)
2 x Szechuan Chicken in Garlic Chilli Sauce (£5.99 each)
1 x Stir Fried Mixed Vegetables in Black Bean Sauce (£4.99 each)
---------------
TOTAL = £23.46
---------------
 => nil 
 ````

 Finally, submit the order to the Takeaway as follows. Note that the amount tendered must equal the total amount of the order to submit. Provided the Twilio information is correctly entered, a text confrimation will be sent.

 ````
 2.6.5 :019 > t.submit_order(order1, 23.46)
 ````



Additional information
----

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
