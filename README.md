Takeaway Challenge
==================

Week 2 weekend challenge to model a takeaway, including connecting to 3rd party API (Twilio) to send confirmation sms messages.

Files:
- takeaway.rb: The main program, which holds the restaurant itsef and handles user interaction
- menu.rb: Holds the menu items, and related methods
- order.rb: Creates a specific order and related methods

Requirements 
-------

+ Twilio ruby gem: service used to send sms messages
+ dotenv gem: used to store authentication details in separate file to main project, keeping these local and not publicly accessible

All requirements can be installed by installing the bundler gem (`gem install bundle`) and then running `bundle install` in the project directory.

N.B. Sending confirmation sms requires Twilio account with a number that can send sms, and a .env file in the project root directory containing the following:

```
ACCOUNT_SID = "..."
AUTH_TOKEN = "..."
SENDING_NUMBER = "..." # your Twilio number
MY_NUMBER = "..." # the recipient
```

User Stories implemented
-------

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

Instructions
-------

- Create new restaurant: `my_restaurant = Takeaway.new`
- View menu: `puts my_restaurant.menu`
- Add an item to the order: `my_restaurant.order "item name", quantity (optional)`
- View items in current order & cost breakdown: `puts my_restaurant.order_summary`
- Check total price: `my_restaurant.check_total`
- Submit order: `my_restaurant.submit_order`
