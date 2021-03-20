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

User class
Owns menu variable 

US1
Dish owns price
Menu class which creates and stores dishes?
see_menu - lists out dishes with prices

US2
select_dishes - select and store dishes
getting user input - mock this
Edge case - input does not match case
dish owns available
- restaurant method to say dish is out of stock.

US3
check_total - sum of prices of selected dishes
Maybe provides a run through of the order (preview)
Could get user input - ask if user is happy with order
  if yes/true then process order and send_text
  if not/false then could continue to ask to add/remove item.
    Extra - add a remove dish option.

US4
send_text - sends a text message (string) "Thank you! Your order was placed and will be delivered before #{time.now + MAX_WAITING_TIME}"
Menu owns MAX_WAITING_TIME

Twilio API
  gem file
  set phone number to environment variable

Notes
- add implementation for extra menus (drinks)
- subclasses starter, main, desert, drinks and polymorphic
  functions
- add prep time instance variable for dishes, create a function which calculates wait time.
- Makes user class which gets user input and calls Restaurant methods in loops.
- might be better design to have an interface class above User and restaurant, which controls interactions between them.