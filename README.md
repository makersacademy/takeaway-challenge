Introduction
---------
This repo contains the code I wrote for the Takeaway Challenge, the Makers Academy Week 2 end-of-week challenge. This involved creating software for a takeaway program based on the following user stories:
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

My approach
---------
This challenge came at the end of a week spent working with rspec doubles and class objects. I decided to approach this challenging by establishing several different classes and writing code for them based on a TDD approach.

I began by creating a single class Order class with all functionality included in it. I then extracted Menu, Item and Basket classes. All rspec tests have been made with doubles to ensuring testing isolation.

Once all classes were built, fully functional, linted, refactored and successfully tested, I research sms capabilities and used Twilio to allow the program to send text messages.

All four user stories have been addressed (see Instructions for use below).

With more time, I would have developed SMS capabilities further by allowing users to order by SMS. I would also have used environment variables to fill out SMS details, and I would also have created rspec tests to ensure 100% coverage.

Total rspec testing coverage: 97.45%; 17 rspec tests; rubocop passed with no offences.



Instructions for use
---------
### Setup:
1) If you want to send text messages, find the send_sms.rb file in the lib folder. The $account_sid, $auth_token, $to and $from variables are all filled as empty strings. Change these to the appropriate Twilio account details, with to and from phone numbers. Note: if you don't fill these out, the program can still be used, but text messaging will be disabled, and yo will receive a warning informing you of this when you run the program in irb
2) Initiate irb in a command line terminal
3) Require takeaway.rb, e.g. enter 'require "./lib/atc.rb"'

### Ordering:
1) Create a new order by calling **my_order = Order.new**
2) To review the menu of options, enter **my_order.review_menu**
3) To add an item to your basket, enter **my_order.add_to_basket(n1, n2)**, where n1 is the menu number of the food item to be added, and n2 is the quantity
3) To review your basket, enter **my_order.review_basket** (note: this is displayed automatically whenever something is added to the basket)
4) To place an order, enter **my_order.place_order**. You will see a confirmation message if successful. If texting is enabled, you will receive a text at this time
