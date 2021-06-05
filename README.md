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
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.


My Solution
-----
A Makers Week 2 solo weekend challenge. 

* **Languages used**: Ruby
* **Testing frameworks**: RSpec

## Personal goals of this project
* practise Domain Modelling
* maintain isolation when unit testing using dependency injections
* high cohesion, low coupling
* testing the right thing
* consider edge cases
* practise more TDD using RED-GREEN-REFACTOR
* remember to refactor and use SRP!

## Functional Representation of User Stories

| Nouns | Property or Owner of property? |
| --- | --- |
| TakeAway | Owner |
| Dish | Owner |
| name | Property owned by Dish |
| price | Property owned by Menu |
| Menu | Owner |
| list_of_dishes | Property owned by Menu |
| customer_order | Property owned by TakeAway |

| Actions | Action owned by? | Property it reads or changes | Property owned by? |
| --- | --- | --- | --- |
| see_menu | TakeAway | list_of_dishes (reads) | Menu |
| select_dishes | TakeAway | list_of_dishes (reads), customer_order (changes) | Menu, TakeAway |
| total | TakeAway | customer_order (reads) | TakeAway |
| order | TakeAway | customer_order (reads) | TakeAway |
| send_text | TakeAway (private) | n/a | n/a |
| add_dish | Menu | list_of_dishes(changes) | Menu |

## Domain Model

| Class | TakeAway |
| --- | --- |
| **Properties (instance variables):** | @customer_order : Array |
| **Actions (methods):** | see_menu, select_dishes, total, order, send_text (perhaps private method) |
* depends on menu, and also depends on dishes

| Class | Dish |
| --- | --- |
| **Properties (instance variables):** | @name|
| **Actions (methods):** | N/A |
* has no dependencies

| Class | Menu |
| --- | --- |
| **Properties (instance variables):** | @list_of_dishes : Array of Hashes |
| **Actions (methods):** | add_dish() |
* depends on dishes

## Additional set up

```
bundle install
```

To run feature tests in `irb`:
```irb
<!-- SOME STUFF HERE -->

```

## Approach
**Domain Modelling using Class Diagrams**
* Intense investigation on user stories and Domain Modelling. (please see diagrams above).
* I wanted to determine what classes may be needed in order for the domain to be as cohesive as possible with minimal coupling. It was clear that I needed to create 3 classes: `TakeAway`, `Menu`, and `Dish`.

**Test drive `Dish` class**
* The `Dish` class has no dependencies on other classes. It was easy to implement this with just a name.

**Test drive `Menu` class**
* The `Menu` class would have an instance variable containing an Array of dishes (instances of the `Dish` class). Since the `Menu` class has dependencies on the `Dish` class, I need to create Dish doubles in order to unit test `Menu` in isolation.
* Since we do not know how many dishes might be added to a menu, I TDD'd a new method to add dishes to a menu `add_dish`, using dependency injection. 
* I imagine the `list_of_dishes` instance variable would be an array containing hashes representing the dishes and their prices. 
* The prices would be determined when you add the dish to the menu.
* The menu class could easily be extended to remove_dishes as well. 

**Test drive `TakeAway` class**
* Next I imagined how we would run the takeaway in IRB in a feature test. Perhaps it is initialized with a default menu if one is not given in advance:

```irb
require './lib/menu.rb'
require './lib/takeaway.rb'
dish_1 = Dish.new( "McNuggets" )
dish_2 = Dish.new( "Big Mac" )
dish_3 = Dish.new( "Chicken Legend" )
menu = Menu.new
menu.add_dish(dish_1, 3.19)
menu.add_dish(dish_2, 3.19)
menu.add_dish(dish_3, 3.89)
takeaway = TakeAway.new(menu)
takeaway.see_menu
```



## Files
| File    | Description |
| ----------- | ----------- |
| README.md  | this readme page :) |
|  |  |
|  |  |
|  |  |
| **all other files** | **as forked from original repo** |

## TODO

* What if someone tries to add a non-dish to the Menu? How would we TDD this in RSpec given that instance_doubles (a verifying double) of `Dish` does not return true when asking it if it `is_a? Dish`
* Refactor RSpec tests
* 
