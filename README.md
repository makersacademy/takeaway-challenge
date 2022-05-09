Takeaway Challenge Attempt
==========================

The original README text is retained below.


Current Issues
--------------

- The final user story regarding a text response is yet to be implemented.
- Some of the outputs are not particularly easy to read and include object memory references, I did have methods for these but removed them due to testing/time constraints.
- My tests are very poor, I have not properly utilised doubles, stubs or mocks and so the tests are
not independant of external classes.


Approach
--------

Divide responsibilities up between classes, keep methods short, use private methods when
appropriate, use a strict TDD approach to develop classes and methods, make sure tests are independent, stick to the Single Responsibility Principle as much as possible.

Initial concept
---------------

A Takeaway class handles the taking of orders, gets the details of ordered items from a menu
then adds them to a basket where a price is calculated and given to the customer, when the order
is complete, the Takeaway will instruct a messanger object to send a text to the customer confirming
the order and the total price.

Example outputs
---------------

````
2.6.5 :001 > # create a new instance of takeaway
 => nil 
2.6.5 :002 > PapaGraemes = Takeaway.new
 => #<Takeaway:0x00007fb7c285cfb0 @order=[], @menu=#<Menu:0x00007fb7c285cf60 @dishes=[{:name=>"Pizza", :price=>10}, {:name=>"Parmo", :price=>9}, {:name=>"Calzone", :price=>11}]>> 
2.6.5 :003 > # check the menu
2.6.5 :004 > PapaGraemes.menu
 => #<Menu:0x00007fb7c285cf60 @dishes=[{:name=>"Pizza", :price=>10}, {:name=>"Parmo", :price=>9}, {:name=>"Calzone", :price=>11}]> 
2.6.5 :005 > # we can order an item that is on the menu with .order_dish
2.6.5 :006 > PapaGraemes.order_dish("Pizza")
 => [{:name=>"Pizza", :price=>10}] 
2.6.5 :007 > # we can order multiple items too
2.6.5 :008 > PapaGraemes.order_dish(5, "Parmo")
 => [{:name=>"Pizza", :price=>10}, {:name=>"Parmo", :price=>9}, {:name=>"Parmo", :price=>9}, {:name=>"Parmo", :price=>9}, {:name=>"Parmo", :price=>9}, {:name=>"Parmo", :price=>9}] 
2.6.5 :009 > # thats a lot of food, we can complete out order, get an itimised receipt and a total price
2.6.5 :010 > PapaGraemes.complete_order
Pizza - £10
Parmo - £9
Parmo - £9
Parmo - £9
Parmo - £9
Parmo - £9
Total - £55
 => 55 
2.6.5 :011 >
````
I have removed some of the nil returns for brevity but retained the important outputs.

Original README below

================================================================================




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
