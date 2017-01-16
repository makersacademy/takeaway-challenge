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
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you submit a pull request, and you can also get a summary locally by running:

```
$ coveralls report
```

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

Build Badge Example
------------------

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)

##Jaycee Cheong's approach
I created 4 classes to adhere to single responsiblity principle 
1. takeaway.rb
2. menu.rb
3. order.rb
4. send_sms.rb

Below is the domain model:


|Object                |Message         |  
| :-------------:      |:-------------: |
|Customer              |               |
|Takeaway              |list_menu?      |
|Menu                  |list_menu       |
|Order                 |order           |
|SMS                   |send_sms        |


##How to use

1) On your terminal , clone the project and run the command `gem install bundle` (if you don't have bundle already)

2) Once the installation completes, run `bundle`

3) Create a file called ".env" in your 

4) Edit the file with
```
ACCOUNT_SID = Your Twilio Account SID
AUTH_TOKEN = Your Twilio Auth Token
PHONE_NUMBER= The phone number to receive the sms (string format)
TWILIO_NUMBER = Your Twilio number to send the sms (string format)
```

5) On your terminal, run irb and below is an example of how to use the program

```
Jaycee:takeaway-challenge Jaycee$ irb
2.3.1 :001 > require './lib/takeaway.rb'
 => true 
2.3.1 :002 > hut = Takeaway.new
 => #<Takeaway:0x007fe97227a188 @menu=#<Menu:0x007fe97227a160>, @order=#<Order:0x007fe97227a138 @items=[], @summary="">> 
2.3.1 :003 > hut.list
 => {"Pepperoni Pizza"=>6.0, "American Hot Pizza"=>6.5, "Four Season Pizza"=>7.5, "Double Pepperoni Pizza"=>8.5, "Garlic Bread Starter"=>3.5, "Coca-cola 350ml can"=>0.9, "Fanta 350ml can"=>0.9} 
2.3.1 :004 > hut.order "Pepperoni Pizza", 2
 => "2 x Pepperoni Pizza(s) added to basket" 
2.3.1 :005 > hut.order_summary
 => " 2 x Pepperoni Pizza(s) = £12.00 | " 
2.3.1 :006 > hut.check_total
 => "£12.00"
2.3.1 :007 > hut.complete_order
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC9fe864dc6d88faab1607dccba36ba0b4/Messages/SMd06abc05826e4708b68788f74283c895> 
 #SMS received with message "Thank you for your order: £12.00 and will be delivered before 10:03
```

Currently the complete order command (line #007) will send a text message to a test mobile number, please update the to_num to your test mobile number in send_sms.rb 

