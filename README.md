# README: RACHEL GRIFFITHS

Used following programs:

Ruby 2.5
RSpec
Rubocop

All tests pass.
Achieved 100% coverage.

[NB. Limited time available to spend on this challenge due to personal commitments. Therefore, I've written in detail my plan for each user story even though I was unable to start working on User Stories 3 & 4]

### KEY LEARNINGS:
* Doubles
* Use of 'context' to tell my testing 'story'
* Building experience in using arrays & hashes although need to develop iteration skills.
* Spent a lot more time planning out each user story and breaking them down into simple objects and methods.
* Single Responsibility Principle - tried to use this to guide all methods & tests.

## USER STORIES: DOMAIN MODEL

### 1. USER STORY 1: CREATE A MENU

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

	* Create menu: list of dishes with prices
	* Create a menu_entry hash for each dish and price
	* Create a menu array to store each menu_entry

	CLASS: Menu, MenuEntry

  | OBJECT        | METHOD        	|
  | ------------- |:---------------:|
  | menu_entry    | add_dish      	|
  | menu_entry    | add_price     	|
  | menu          | add_menu_entry  |

ISSUES:
	* Menu is not printed for it to be seen.
	* Should have created only one class - create menu_entry hash as part of the Menu class as done in User Story 2.

### 2. USER STORY 2: ORDER SELECTION

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

	* Place the order by giving:
		* the list of dishes,
		* their quantities and
		* a number that should be the exact total.

	* Create Order class and link Menu Class
	* Select dishes from menu array and enter quantity required of each dish - store in a hash.
		* Raise error if dish unavailable?
	* Store the list of dishes and equivalent quantity in an order array

	* Calculate total price of the order - link order hash to menu array

	CLASS: Order, Menu

  | OBJECT        | METHOD      										  |
  | ------------- |:---------------------------------:|
  | order         |	selection(dish, quantity)					|
  | order         | initialize (order_selection array)|
  | order         | total_cost								        |
	|	order					|	not_included_in_menu?							|

ISSUES:
	* You can select dishes that aren't on the menu as couldn't get the private method not_included_in_menu? to work (this is hashed out) and therefore, could not complete the raise_error test or message.
	* Ran out of time to complete the tota_cost method.

PLAN FOR total_cost METHOD:
	* Take keys (dish) from the order_selection array,
	* Look them up in the menu array,
	* Return the equivalent value (price) from the menu array,
	* Replace the key (dish) in the order_selection array with the price,
	* Multiply the updated key (price) by the value (quantity) in the order_selection array and sum.

	* Possibly use inject method to iterate over the array/hash.
	* Not 100% sure if this PLAN will work!

### 3. USER STORY 3: ORDER CONFIRMATION

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

	* VERIFY: Sum prices of selected dishes, match back to total given to the customer??
	* If the sum is not correct the method should raise an error.

	CLASS: Order, Menu

  | OBJECT        | METHOD                    |
  | ------------- |:-------------------------:|
  | order         | total_dishes              |
  | order         | itemised_total (receipt)  |
  |               |                           |

ISSUES:
	* Ran out of time to look into this User Story in more detail.

### 4. USER STORY 4: TEXT CONFIRMATION

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as “Thank you! Your order was placed and will be delivered before 18:52” after I have ordered

	* DELIVERY: Confirm order via text containing delivery time.		
	* If sum is correct, send text.

	Class: Order

  | OBJECT        | METHOD                    |
  | ------------- |:-------------------------:|
  | order         | order_confirmation (text) |
  |               |                           |
  |               |                           |

ISSUES:
	* Ran out of time to look into this User Story in more detail.

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
