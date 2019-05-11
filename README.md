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
---
# My Approach
For this challenge I have looked at each user story, and mapped out how I will approach this along with what classes and methods will be needed to implement that functionality. Then I will use a feature test to explore how this feature will work using the program, then begin to write unit tests based on the functionality I need. Then I will implement the code needed to make these tests pass.

I have mapped this out in a table below each user story. I will then demonstrate in irb how this functionality works correctly.

---
## First User Story
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

Object | Message
- | -
user | print_menu

```
2.5.0 :001 > require './lib/menu'
 => true
2.5.0 :002 > menu = Menu.new
 => #<Menu:0x00007f9d2f1884a8 @basket=[]>
2.5.0 :003 > menu.print_menu
Here is our list of pizzas:
Margarita, £8
Ham and Pineapple, £9
The Mo Salah, £12
Meatilicious, £11
Veggie McVegface, £7
The LFC Pizza, £15
 => [{"Margarita"=>8}, {"Ham and Pineapple"=>9}, {"The Mo Salah"=>12}, {"Meatilicious"=>11}, {"Veggie McVegface"=>7}, {"The LFC Pizza"=>15}]
 ```

 Above demonstrates how when the print_menu method is called on a new instance of menu, it shows a list of pizzas and their prices. The tests ensure that any new instance of our Menu class initializes with an empty basket.

 ---
## Second User Story
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

Object | Message
- | -
user | select_dish

```
2.5.0 :001 > require './lib/menu'
 => true
2.5.0 :002 > menu = Menu.new
 => #<Menu:0x00007fc0ba1d8080 @basket=[]>
2.5.0 :003 > menu.print_menu
Here is our list of pizzas:
1. Margarita, £8
2. Ham and Pineapple, £9
3. The Mo Salah, £12
4. Meatilicious, £11
5. Veggie McVegface, £7
6. The LFC Pizza, £15
 => [{"1. Margarita"=>8}, {"2. Ham and Pineapple"=>9}, {"3. The Mo Salah"=>12}, {"4. Meatilicious"=>11}, {"5. Veggie McVegface"=>7}, {"6. The LFC Pizza"=>15}]
2.5.0 :004 > menu.select_dish(2, 2)
 => "You have added 2 of the {\"2. Ham and Pineapple\"=>9} pizzas to your basket"
2.5.0 :005 > menu.select_dish(4, 1)
 => "You have added 1 of the {\"4. Meatilicious\"=>11} pizzas to your basket"
 2.5.0 :006 > menu.basket
  => [{"2. Ham and Pineapple"=>9}, {"2. Ham and Pineapple"=>9}, {"4. Meatilicious"=>11}]
```
Above demonstrates that after the menu has been printed, the user is able to use the select_dish method to select the number of the dish they want, and how many of the dish they want. They are then notified that their order has been added to the basket. The user can see what is in their basket by calling basket on their menu object.

---
## Third User Story
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

Object | Message
- | -
customer | check_total







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
