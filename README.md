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
 
 Class diagram
-------
![class diagram](https://github.com/AgaDufrat/takeaway-challenge/blob/master/diagram.jpg "Class diagram")


Instructions
-------
```
2.5.0 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x00007fb7399b75b0>
2.5.0 :003 > takeaway.show_menu
Chicken Curry £6.5
Lamb Curry £7
Vegetable Curry £6
 => [{:name=>"Chicken Curry", :price=>6.5}, {:name=>"Lamb Curry", :price=>7}, {:name=>"Vegetable Curry", :price=>6}]
2.5.0 :004 > order = Order.new
 => #<Order:0x00007fb73a13ed10 @dishes=[], @menu=#<Menu:0x00007fb73a13ecc0 @list_of_dishes=[{:name=>"Chicken Curry", :price=>6.5}, {:name=>"Lamb Curry", :price=>7}, {:name=>"Vegetable Curry", :price=>6}]>>
2.5.0 :005 > order.select_dish("Chicken Curry", 2)
 => [{:name=>"Chicken Curry", :quantity=>2}]
2.5.0 :006 > order.select_dish("Fish & Chips", 1)
RuntimeError (Can't select: dish not available. Type `takeaway.show_menu` to see the menu)
2.5.0 :007 > order.select_dish("Lamb Curry", 1)
 => [{:name=>"Chicken Curry", :quantity=>2}, {:name=>"Lamb Curry", :quantity=>1}]
2.5.0 :008 > order.total_cost
 => 20.0
2.5.0 :009 > takeaway.place(order)
 => 20.0
 ```

 References
 -------
 * [Hide API Keys](https://gist.github.com/derzorngottes/3b57edc1f996dddcab25)
 * [Testing SMS Interactions](https://robots.thoughtbot.com/testing-sms-interactions)
