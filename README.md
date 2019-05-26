-Use only the app class to interact with the programme which refers to menu, order and message class. 
-100% test coverage for my own implemented method but not for the API
-added a Twilio spec to test my delivery time method, possibly could've added this to the order class but decided not to as twilio didn't need to know about the order's info. 

2.6.0 :001 > require './lib/app'
 => true 
2.6.0 :002 > require './lib/menu'
 => true 
2.6.0 :003 > require './lib/order'
 => true 
2.6.0 :004 > require './lib/twilio'
 => true 
2.6.0 :005 > app = App.new
 => #<App:0x00007fd1572b6fd0 @menu=#<Menu:0x00007fd1572b6fa8 @items=[{:item=>"Margherita", :price=>10}, {:item=>"Hawaiin", :price=>12}, {:item=>"Pepperoni", :price=>11}, {:item=>"Ham and Mushroom", :price=>11}]>, @order_class=Order, @current_order=nil, @sender_class=#<Sender:0x00007fd1572b6e18 @mobile="+447588496067", @twilio_number="+447723464572", @account_sid="AC776a9489673a798e4bd586b38b049469", @auth_token="277dfe5814dac05cab858cb9d4cd7d0c">> 
2.6.0 :006 > app.display_menu
Margherita £10
Hawaiin £12
Pepperoni £11
Ham and Mushroom £11
 => [{:item=>"Margherita", :price=>10}, {:item=>"Hawaiin", :price=>12}, {:item=>"Pepperoni", :price=>11}, {:item=>"Ham and Mushroom", :price=>11}] 
2.6.0 :007 > app.select_dish("Margherita")
 => [{:item=>"Margherita", :price=>10, :quantity=>1}] 
2.6.0 :008 > app.select_dish("Pepperoni", 2)
 => [{:item=>"Margherita", :price=>10, :quantity=>1}, {:item=>"Pepperoni", :price=>11, :quantity=>2}] 
2.6.0 :009 > app.place_order(32)
SMba25070c38d0447d8227e0c7ed762c75
 => nil 

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
