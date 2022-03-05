set environment variable: https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html

list of dishes with prices - see, select(number)

checkout total - is_correct? (matches total of dishes ordered)

text - receive (and presumably sendir)

MENU - CHECKOUT/ORDER - MESSAGER

first user story:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

first step - made spec file but no class defined

```
An error occurred while loading ./spec/menu_spec.rb.
Failure/Error:
  describe Menu do
  
  end

NameError:
  uninitialized constant Menu
```

it lets you see menu - expect to respond to see - menu.see returns nil in IRB so need to create a menu, array of hashes seems best bet, make it a constant and initialize with it

can now see menu:

```
jonnyabrams@JONNYs-MacBook-Pro takeaway-challenge % irb -r './lib/menu.rb'
3.0.2 :001 > menu = Menu.new
 => 
#<Menu:0x000000014f9aa1f0
... 
3.0.2 :002 > menu.see
kimchi pancake: 5.99
tteokbokki: 7.99
kimchi-jjigae: 12.99
 => 
[{:dish=>"kimchi pancake", :price=>5.99},
 {:dish=>"tteokbokki", :price=>7.99},
 {:dish=>"kimchi-jjigae", :price=>12.99}] 
```

2nd user story:

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

test drove creation of select method (with 2 args - 'number of dishes' in US) and basket


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
