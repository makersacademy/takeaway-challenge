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

Implementation
-------
Loading up in ```irb``` using:
```
irb -r './lib/restaurant.rb'
```
Create a new instance of your restaurant like this:
```
2.5.0 :001 > ratcafe = Restaurant.new
 => #<Restaurant:0x00007fe5551570b0 @menu=#<Menu:0x00007fe555157088 @menu_items={"rat soup"=>4, "mystery meat pie"=>5, "moldy bread"=>1, "stale juice"=>2}>, @current_order=#<Order:0x00007fe555157038 @items=[]>, @total_order_value=0>
```

add items to your order by calling their name in the order() method:
```
2.5.0 :002 > ratcafe.order("rat soup")
1 x rat soup added
```
The method can take quantity arguments to add multiple entries of the same item:
```2.5.0 :003 > ratcafe.order("moldy bread", 2)
2 x moldy bread added
```
The user can also request to see their total bill at any given time:
```
2.5.0 :005 > ratcafe.print_total
 => "You owe Rat Cafe £5. Please pay now."
 ```
The user completes an order by calling the complete_order method with the amount they owe:
```
2.5.0 :008 > ratcafe.print_total
 => "You owe Rat Cafe £9. Please pay now."
2.5.0 :009 > ratcafe.complete_order(9)
=> "£9 paid. Order complete. It will arrive by 22:33"
```
The system will give an error if the bill due and the amount paid do not match:
```
2.5.0 :008 > ratcafe.print_total
 => "You owe Rat Cafe £9. Please pay now."
2.5.0 :009 > ratcafe.complete_order(2)
 => RuntimeError (Incorrect amount paid, please retry)
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
