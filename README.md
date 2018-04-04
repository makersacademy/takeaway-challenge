[![Build Status](https://travis-ci.org/MaryDomashneva/takeaway-challenge.svg?branch=master)](https://travis-ci.org/MaryDomashneva/takeaway-challenge)
[![codebeat badge](https://codebeat.co/badges/5f9ca3a7-c57f-4fb6-b820-3f823580ae9c)](https://codebeat.co/projects/github-com-marydomashneva-takeaway-challenge-master)

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

Task
-----

Use the Twilio Gem to order food

User story
-----

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

Technology used
-----

* Ruby 2.5.0
* TWILIO API
* Rspec
* Capybara

Run project
-----

* In order to use the app following environment variables are required:
```
TAKE_AWAY_TWILIO_NUMBER // twilio number to send sms from
TAKE_AWAY_TWILIO_ACCOUNT_SID // twilio account sid
TAKE_AWAY_TWILIO_AUTH_TOKEN // twilio auth token
TAKE_AWAY_TWILIO_MY_NUMBER // client number to recieve sms
```
* In order to run tests, clone project, install ruby 2.5.0, install Rspec ```gem 'rspc'``` and ```rspec``` command in terminal.
* The easiest way to try project is in IRB: ```inside terminal irb -r./takeaway-challenge```

Result
-----

The app has folowing classes:
1. Customer
has initial hungriness ```status```, the initial amount of money on ```bank_account```, and ```telephone```
Customer can ```place_an_order``` in restaurant if customer is ```hungry``` and ```pay_an_order``` from ```bank_account``` if customer has enough money.
Customer can recive confermation that order was placed via sms (implemented using Twilio API).
2. Restaurant
has initial ```menu``` and ```bank_account```. It can ```show_menu```, ```take_an_order``` and ```receive_money``` from customer for total amount of order.
3. Dish
has name and price and can be randomly generated according to one out of four categories menu.
4. Dish_order (support)
creats dish orders out of ```dish``` and the number of how many such ```dish``` customer wants - ```count```
5. Menu
has initial categories which can be filled with ```Dish.new```. It can ```print_menu``` and generage menu using ```menu_generator```
6. Order (support)
forms dish orders to one order.
