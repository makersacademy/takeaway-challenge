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

Introduction
---------

Solution to the Makers Week 2 Weekend Challenge - takeaway challenge by Jack McCarthy (jackmcc08).

The program was developed largely through TDD (the TWILIO integration required some actual coding before test writing :) ).

I developed the 4 user stories into 5 classes - takeaway, order, menu, customer & send_text. See [google doc](https://docs.google.com/document/d/119-FgcFIqvIv14avQnq6bQnjIslTz9yxshp36d3w1Xo/edit?usp=sharing) for initial pre-work to frame progam and domain model.

On completion:
- all user stories were delivered
- all RSPEC tests passed
- there was 100% test coverage
- there were no Rubocop errors
- did not implement the ability to order meals via text

Concerns:
- Implemented Environment variables for security to ensure TWILIO information was not made public. However could not set up a project specific environment section correctly - future improvement.
- Could do some more extraction to enhance srp & polymorphism e.g. gbp_format into a module.
- Did not fully explore edge cases so potential for some errors.
- not sure if I implemented constants properly in setting up the program.

Future Improvements:
- Implement user inputted number to be texted (would require Twilio upgraded account)
- refactor and test edge cases more
- custom menus
- allow user to remove items from menu which aren't available

Have fun!

Instructions for use
----------
#### RSPEC Testing
In the project folder run rspec to show test demonstration, it will give you an overview of the functionality of the program.

#### TWILIO functionality
Without setting up .zshenv with the TWILIO constants the program will not send you a text message on completion of the order.

In order to implement TWILIO:
1. create a .zshenv file in your root directory (if using zsh shell)
2. add the following constants to the .zshenv file:
- export TWILIO_ACCOUNT_SID='your TWILIO SID'
- export TWILIO_AUTH_TOKN='your TWILIO TOKEN'
- export TWILIO_FROM='your TWILIO Number'
- export TWILIO_TO='your receiving Number'

If you don't add this setup the program will still run and should not error out.

#### Classes and Methods

You only need to set up two classes to run the program fully, neither need arguments:
- Class: Takeaway
  - Create with Takeaway.new
  - Methods:
    - .display_menu
    - .display_current_order
    - .add_to_order(menu item number, quantity)
    - .remove_from_order(order item number, quantity)
    - .checkout(customer class instance)
    - .place_order(customer class instance)

- Class: Customer
  - Create with Customer.new
  - no methods needed for use at this stage

#### IRB

Run 'bundle install'

To operate the program in IRB, open with below commands. Create a takeaway instances and a customer instance to enable manipulation of program.

All classes and methods listed below this section.

```ruby
2.6.5 :001 > require './lib/takeaway.rb'
 => true
2.6.5 :002 > test = Takeaway.new
 => #<Takeaway:0x00007f878d0a6290 ... @to="+447985636884">>
2.6.5 :003 > jack = Customer.new
 => #<Customer:0x00007f878d0acb18 @number="08008888888", @address={:address=>"72 Reunification Avenue, New Tokyo, UNC", :post_code=>"12NE XS9"}, @payment={:type=>"credit_card", :number=>78385283584, :expiry_date=>"12/77", :ccc=>888}>
2.6.5 :004 > test.display_menu
 => "MENU\n1. Spicy Edamame  Price: £4.20\n2. Salt and Chilli Vat Chicken Strips  Price: £5.20\n3. Tempura Seaweed Fish  Price: £8.00\n4. Space Whale Sashimi  Price: £16.00\n5. Venerable Dragon Roll  Price: £9.80"
2.6.5 :006 > test.display_current_order
 => "You have not selected any items."
2.6.5 :007 > test.add_to_order(4,2)
 => {"Space Whale Sashimi"=>2}
2.6.5 :008 > test.remove_from_order(1,1)
 => "Removed 1 Space Whale Sashimi from order."
2.6.5 :009 > test.display_current_order
 => "YOUR ORDER\n\n1. Space Whale Sashimi  Price: £16.00  Qty: 1  Sub: £16.00\n\nTOTAL: £16.00"
2.6.5 :010 > test.checkout(jack)
 => "Your order is £16.00.\nYour address is: 72 Reunification Avenue, New Tokyo, UNC, 12NE XS9\nYour number is: 08008888888\n\nPlease press PLACE ORDER to confirm."
2.6.5 :011 > test.place_order(jack)
 => "<Twilio.Api.V2010.MessageInstance ...json}>"

 ```

HAVE FUN!

## Original Instructions

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
