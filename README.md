NEED TO ADD RSPEC TEST FRO TWILIO

For Info: I couldn't get the 'send_sms.rb' to work, I got the following error message:
require': cannot load such file -- twilio-ruby (LoadError)

# to run in IRB
3.0.0 :001 > require './lib/menu'
 => true 

3.0.0 :002 > require './lib/takeaway'
 => true 

3.0.0 :003 > t =  Takeaway.new
 => #<Takeaway:0x000000015395d400 @order_dishes=[], @menu_dishes=nil> 

3.0.0 :004 > t.retrieve_menu
 => {"Chicken Tikka"=>8.45, "Butter Chicken"=>7.25, "Lamb Korma"=>9.45, "Beef Kebab"=>9.25, "Egg Fried Rice"=>4.45, "Steamed Rice"=>4.45, "Crispy Broccoli"=>5.45, "Creamy Spinach"=>2.45, "Naan"=>8.45, "Papadom"=>1.45, "Cola"=>345} 

3.0.0 :005 > t.add_order_item "Beef Kebab"
 => [{:dish=>"Beef Kebab", :price=>9.25, :quantity=>1}] 

3.0.0 :006 > t.add_order_item "Butter Chicken" , 5
 => [{:dish=>"Beef Kebab", :price=>9.25, :quantity=>1}, {:dish=>"Butter Chicken", :price=>7.25, :quantity=>5}] 

3.0.0 :007 > t.order_total
 => 45.5 

3.0.0 :008 > t.checkout
 => "Thank you! Your order was placed and will be delivered before 17:45" 

3.0.0 :009 > t.add_order_item "Chicken Tikka" , 2
 => [{:dish=>"Chicken Tikka", :price=>8.45, :quantity=>2}] 

3.0.0 :010 > 



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
