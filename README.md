Takeaway Challenge
==================

### Notes

All user stories have been completed in this challenge.

A user would run the program as follows. In IRB, load a menu with:

```ruby
menu = Menu.new
```

To see what dishes are on the menu:

```ruby
menu.show
```

To start a new order:

```ruby
order = Order.new
```

To add a dish to the order, the user needs to pass two arguments into the method; the menu and the name of the dish in the form of a string, as follows:

```ruby
order.add(menu, "pizza")
```

To see the order and how much the order will cost:

```ruby
order.view
```

To place the order:

```ruby
order.place
```

A text message confirming the order will then be sent to the user.

### Design

There are five classes in this program:

* [Menu](#menu-class)
* [Order](#order-class)
* [Dish](#dish-class)
* [Calculator](#calculator-class)
* [Texter](#texter-class)

#### Menu class

The menu is an array of dish objects. This is loaded from a .csv file on initialisation through the load_file private method. The .csv file contains all items on the menu, whether available or unavailable.

The show method prints out a list of available items on the menu, with their prices; any items that are unavailable will not appear on screen.

The check method takes the name of a dish (in the form of a string) as an argument. This checks whether the dish is 1) on the menu at all, or 2) unavailable. If the dish is on the menu and available then the method returns the dish - this method is called when the user asks to add a dish to their order (this defends against edge cases, such as a user trying to add a dish to the order that is unavailable).

I have not used an attribute reader, to help maintain encapsulation, and the Dish class is injected into the menu object on initialisation to keep the classes isolated.

#### Order class

This class is where the user can store dishes that they wish to order.

When the object is initialised, an empty array is created as the @list variable.

The user can add dishes to this list through the add method. Add takes two variables; menu and dish. THe method checks whether the dish is in the menu through a call to menu.check, which if the dish is valid, returns the dish. That dish is then stored in @list.

Ideally there would only be one variable (dish) but I wasn't able to work out how to define which menu instance to use as a default. I think now I could just create a new object of the menu class as this would have the same default attributes, but I am not going to do any more refactoring on this challenge now.

The user can view their order, including the prices of each individual dish and the total, with the view method. This invokes the Calculator class to add up the total cost. The private method calculate creates an array of the prices to be calculated, and passes that to the Calculator class through the Calculator.total() method.

The user places their order with the place method, which invokes the Texter class to create and send the text message.

I have not used an attribute reader, to help maintain encapsulation, and the Dish, Calculator and Texter classes are injected into the menu object on initialisation to keep the classes isolated.

#### Dish class

This class stores information about dishes, including the name, price and whether it is available.

Attributes are accessible only through methods, which each return a duplicate of the attribute rather than the attribute itself, to help maintain encapsulation.

#### Calculator class

This has a single method, total, that takes an array of prices as an argument and returns the total.

#### Texter class

This class contains the text functionality. It has one public method, send, which sends a message (invoking the private method, time) and returns :message_sent.

The private method time calculates what time the order should arrive with the client.

### Reflection

Possible further refactoring:

* Remove hard-coding of values in the test suite.
* Refactor order.add to only take a single variable, the name of the dish.
* Refactor order.add to defend against edge cases, such as users entering the name of a dish in capital letters.
* Consider all classes in light of SRP.
* Check test suite to ensure it is DRY.
* Expanding test coverage of the texter class - I don't really know how to test that properly.

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
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
