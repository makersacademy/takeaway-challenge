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

The software is made of 4 classes: Restaurant, Menu, Order and Dish

This is what RSpec report:
Dish
  .new
    will be initialized with 2 parameters
  #name
    returns the name of the dish
  #price
    returns the price of the dish

Menu
  #dishes
    stores an array of dishes
  #list_dishes
    returns a string with all the dishes and they are price

Order
  #dishes
    stores selected dishes
  #total
    calculate and return the total of the order

Restaurant
  should respond to #twiliohelper
  #confirm
    triggers the confirmation process

TwilioHelper
  when testing
    it returns the message
  when not testing
    it sends the message and returns it for confirmation (PENDING: Temporarily skipped with xit)

Twilio has to be setted up by creating a file lib/twilio-configure.rb like this:
module TwilioConfigure
  ACCOUNT = 'account_id'
  TOKEN = 'token_number'
end

The spec/feature_spec.rb file was used for BDD, so refer to it for instructions on how to use this code and its possibilities
