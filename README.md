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

Solution
-------

The program allows the user to:
* see a list of dishes with prices
* select their order from a number of several available dishes
* checkout with a total
* receive a text (using the Twilio API) upon order completion

Environment variables have been used to hide private details in the Text class.

# Feature Test

```
2.6.5 :001 > takeaway = Takeaway.new
 => #<Takeaway:0x00007fb478e75a98 @menu=#<Menu:0x00007fb478e75a70 @basket_sum=0, @dishes=[{:name=>"Big Mac", :price=>"3.19"}, {:name=>"Quarter Pounder", :price=>"3.19"},
 {:name=>"McChicken", :price=>"3.00"}, {:name=>"Cheeseburger", :price=>"0.99"}, {:name=>"Hamburger", :price=>"0.89"}, {:name=>"French Fries", :price=>"1.09"}]>, @text=#<
Text:0x00007fb478e75750>, @basket={}>
2.6.5 :002 > takeaway.show_menu
1. Big Mac: £3.19
2. Quarter Pounder: £3.19
3. McChicken: £3.00

4. Cheeseburger: £0.99
5. Hamburger: £0.89
6. French Fries: £1.09
 => [{:name=>"Big Mac", :price=>"3.19"}, {:name=>"Quarter Pounder", :price=>"3.19"}, {:name=>"McChicken", :price=>"3.00"}, {:name=>"Cheeseburger", :price=>"0.99"}, {:nam
e=>"Hamburger", :price=>"0.89"}, {:name=>"French Fries", :price=>"1.09"}]
2.6.5 :003 > takeaway.see_order
 => "Basket is empty"
2.6.5 :004 > takeaway.order("Quarter Pounder")
 => "1x Quarter Pounder added to the basket"
2.6.5 :005 > takeaway.order("McChicken")
 => "1x McChicken added to the basket"
2.6.5 :006 > takeaway.order("French Fries", 2)
 => "2x French Fries added to the basket"
 2.6.5 :007 > takeaway.see_order
Order is as follows:
Quarter Pounder x1
McChicken x1
French Fries x2
 => nil
2.6.5 :008 > takeaway.checkout(2)
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):8
        1: from /Users/student/Projects/takeaway-challenge/lib/takeaway.rb:33:in `checkout'
RuntimeError (That is not the right price of the order, please try again)
2.6.5 :009 > takeaway.checkout(8.37)
 => "Order successful, a confirmation text should be in it's way"
```

# Possible improvements
* Allow takeaway owners to add and remove items from the menu
* Allow users to place orders via text
* Use higher level stubbing to get better test coverage of text functionality

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
