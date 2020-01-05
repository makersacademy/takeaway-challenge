
# Takeaway Challenge

Allow users to order items from a menu, place the order, and recieve a text with order confirmation.

## Getting Started

### 1. Run Bundle Install

Before you run the program, make sure your gems are up to date by running:

```
$ bundle install
```

### 2. Rename .env.sample 

Rename the *.env.sample* file to *.env*

### 3. Add Twilio Details to .env

Update your .env file with the correct Twilio information. *NOTE in order to access the Twilio API to send texts to the user, you must [sign up](https://www.twilio.com/) for a Twilio account (it's free) and populate the .env file with the correct information: 

```
// Your Account Sid and Auth Token from twilio.com/console

TWILIO_ACCOUNT_SID="ACxxxxxxxxxxxxxxxxxxxxxxxx" 
TWILIO_AUTH_TOKEN="yyyyyyyyyyyyyyyyyyyyyyyyy" 

TWILIO_FROM_NUMBER='+12345678910' # Your Twilio number
TWILIO_TO_NUMBER='+15555555555' # Your mobile number

```

## Running the program

### Option 1 - IRB

```sh
2.6.5 :001 > require './lib/takeaway.rb'
 => true 
2.6.5 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x00007f8e850f0008 @order=#<Order:0x00007f8e850f0850 @menu=#<Menu:0x00007f8e850fbf98 @dishes={"Hummus"=>5, "Falafel Plate"=>10, "Gyro"=>12, "Soft Drink"=>2, "Pita"=>1}>, @orders=[], @total=0, @item_count={}>> 
2.6.5 :003 > takeaway.view_menu
 => {"Hummus"=>5, "Falafel Plate"=>10, "Gyro"=>12, "Soft Drink"=>2, "Pita"=>1} 
2.6.5 :004 > takeaway.add("Hummus", 5)
 => "Item: Hummus | Qty: 5 | $5 - added to order" 
2.6.5 :005 > takeaway.add("Pita", 2)
 => "Item: Pita | Qty: 2 | $1 - added to order" 
2.6.5 :006 > takeaway.add("Soft Drink")
 => "Item: Soft Drink | Qty: 1 | $2 - added to order" 
2.6.5 :007 > takeaway.view_order
Item: Hummus | Qty: 5 | $25
Item: Pita | Qty: 2 | $2
Item: Soft Drink | Qty: 1 | $2
 => {"Hummus"=>5, "Pita"=>2, "Soft Drink"=>1} 
2.6.5 :008 > takeaway.view_total
 => "Total: $ 29" 
2.6.5 :009 > takeaway.submit_order(29)
```

### Option 2 - Interactive File

```
$ ruby order_screen.rb
```

Follow the command line prompts to order from the menu.

```
Welcome to Turco2.0, what would you like to do?
1. See Menu Items
2. Add to Order
3. View Order
4. Finish & Pay
```

## Running the tests

To run tests for this program, run:

```
$ rspec
```


## Built With

* [Twilio](https://www.twilio.com/) - API to send texts with order details
  * To use the app you will need to have a Twilio account (sign up [here](https://www.twilio.com/), it's free)

## User Stories

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
