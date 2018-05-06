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

-------

This task was to write a takeaway program that sends text confirmation to the customer.

User Stories:
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

## Basic Functionality

- The program has a list of dishes (a menu)
- The user places the order by viewing the list of dishes, then entering the dishes and quantities they wish to order
- The cost is  calculated, and the user enters their payment details
- If the payment amount entered by the user is not correct, the user sees an error message, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 21:00."
- The text sending functionality is implemented using Twilio API

## Getting Started

Ruby Version:
```sh
2.5.0
```

Run:
```sh
bundle install
```

## Built with

* Atom - Text editor
* Ruby - Language
* Rspec - Testing suite
* Twilio API
