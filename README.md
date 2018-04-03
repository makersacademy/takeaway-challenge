[![Build Status](https://travis-ci.org/MaryDomashneva/takeaway-challenge.svg?branch=master)](https://travis-ci.org/MaryDomashneva/takeaway-challenge)

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

Structure
-----

The app has folowing classes:
1. Customer
A customer has initial hungriness ```status```, the initial amount of money on ```bank_account```, and ```telephone```
Customer can ```place_an_order``` in restaurant if customer is ```hungry``` and ```pay_an_order``` from ```bank_account``` if customer has enough money.
Customer can recive confermation that order was placed via sms (implemented using Twilio API).
2. Restaurant
3. Menu
4. Dish
5. Dish_order (support)
6. Order (support)
