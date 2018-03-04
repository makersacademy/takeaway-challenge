Takeaway Challenge
==================
***JULIAN'S README***

**USER STORIES & KEY OBJECTS**
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
* `TakeAway`
  * `#show_menu`
  * `@menu` (Menu class object)

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
* `TakeAway`
  * `#start_order`
  * `@curr_order` (Order class object)

* `Order`
  * `#add_item`, `#add_basket` (private)
  * `@menu` (Menu class object), `@item` (hash), `@basket` (array)

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
* `Order`
  * `#check_basket`, `#calc_total` (private)
  * `@total`

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
* `SMS`
  * `#send_sms`

* `TakeAway`
  * `#complete_order`
  * `#send_confirmation`
  * `#customer_payment` (private)
  * `@delivery_eta`

**INSTRUCTIONS**
1. Create a new TakeAway object. This will automatically create a Menu object `@menu`.
2. View the menu using `#show_menu`. It will be `p`'d in the Terminal
3. Start a new order using `#start_order`. This will create a new Order object `@curr_order`
4. Add items to your current order/basket using the `#add_item` method. `#add_item` takes two arguments:
  * `dish` - the menu item; enter as a string; case insensitive.
  * `quantity` - the number of the dish that you want; default to 1 if no number entered
  This method will populate the `@item` hash (consisting of 3 keys `:dish`, `:quantity` and `:subtotal`). the private `#add_basket` method will then be called to push a duplicate of this hash into the `@basket` array. A string will then be `puts`d to confirm what has been added.
5. Check your basket using `#check_basket`. It will list all items you have added to the basket along with the subtotal for those items and the grand total.
6. Complete your order using `#complete_order`. It takes one argument:
  * `amount` - the amount you, as the customer, are paying
  If you pay the exact correct amount, you will receive a confirmation message followed by a text.
  If you pay the incorrect amount, you will receive an error message.

**EXAMPLE CODE**
``` Ruby
  ta = TakeAway.new
  ta.show_menu
  ta.start_order

  ta.curr_order.add_item("egg fried rice", 1)
  ta.curr_order.add_item("SWEET & SOUR CHICKEN", 2)
  ta.curr_order.add_item("Crispy Duck")
  ta.curr_order.check_basket

  ta.complete_order(27.10)
```

***ORIGINAL README***
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
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
