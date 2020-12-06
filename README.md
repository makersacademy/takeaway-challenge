## Takeaway Challenge ##
==================

## How to Use

```shell
irb -r './lib/order.rb'
```
Create a new order, then choose any of the following methods:
view_menu --> displays the menu
select(dish, quantity) --> eg ("dishname", 3)
place_order --> this submits your order

eg.
```irb
my_order = Order.new
Welcome! Please use view_menu to see the menu.
To add a dish to your order, use select(dish, quantity)
To place your order, use place_order.
2.6.5 :002 > my_order.view_menu
Pizza: £6.50
Spaghetti: £5.75
Salad: £5.25 => nil
2.6.5 :003 > my_order.select("pizza",3)
=> "3 pizza(s) added to your order."
```


## My thoughts on the takeaway challenge

I THINK I'M MAKING A BIT OF A MEAL OUT OF THIS CHALLENGE (pun fully intended)

I have really struggled with this challenge and found it very frustrating. I spent hours on it before even attempting the phone stuff!

I would like to focus on my understanding of the SOLID principles (the structure of the classes and methods, high cohesion - low coupling etc), but I feel like RSpec syntax, mocks, stubs etc are getting in the way. I'm spending ages trying to find out how to make an RSpec test work when I know the code is (mostly) working because I've tested it multiple times in irb. For example, in my Dish class I format the price of the dish. When I declare price as a double in RSpec, it then errors in this line because it can't format the double because it's not a float. I can't figure out how to tell RSpec to allow this to happen. I have therefore commented out some of the tests, which has reduced my test coverage.

I also don't understand the 3rd user story, as I don't understand what 2 things need comparing. As far as I can tell, you have to work out the sum of the order and compare that to... the sum of the order...??? Please tell me what I'm missing!

I also know many of my methods are too long.

I will be revisiting this later using the review to help redo it.


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

> :warning: **WARNING:** think twice before you push your **mobile number** or **Twilio API Key** to a public space like GitHub :eyes:
>
> :key: Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
