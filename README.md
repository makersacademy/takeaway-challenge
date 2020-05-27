Takeaway Challenge
==================

[Getting Started](#getting-started) | [Running Tests](#running-tests) | [Criteria for Building the Project](#criteria-for-building-the-project)

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

This repo is a takeaway app developed as part of a project whilst attending Makers Academy.

The requirements of the task:

Using IRB, create an app that allows the user to browse a menu, add dishes to their basket, confirm the total, place the order and receive a text message to confirm the order.

## Getting Started

Ensure you have the following setup on your machine:
- Ruby
- Bundler

Then `git clone` this repository and `cd` into the directory.

#### Install dependencies:

```
$ bundle install
```

#### Setup Twilio:

Visit [Twilio](twilio.com) and setup an account. Then in your project root directory create a `.env` file and add in your API keys and phone numbers:

```
ACCOUNT_SID = <your SID>
AUTH_TOKEN = <your auth token>
TO = <your phone number>
FROM = <your Twilio phone number>
```
Note that you can only send texts in the same country as you have your account.

#### Run the Project

To run the project, start up irb:

```
$ irb
> require './lib/order'
```

Then in `irb` use the following commands:
```
order = Order.new
order.view_menu
order.add(dish, quantity)
order.view_basket
order.place(total)
```


#### Example Code
```
irb
2.6.5 :001 > require './lib/order'
 => true
2.6.5 :002 > order = Order.new
 => #<Order:0x00007fa05da8f228 @menu=#<Menu:0x00007fa05da8f200>, @basket=#<Basket:0x00007fa05da8f1d8 @basket=[], @subtotal=0, @menu=#<Menu:0x00007fa05da8f1b0>>, @orderconfirmation=#<OrderConfirmation:0x00007fa05da8f160>>
2.6.5 :003 > order.view_menu
  burger 10.0
 cheese burger 11.0
 chicken burger 11.0
 seitan burger 12.5
 fries 4.0
 chunky chips 4.5
 coleslaw 3.0
 chicken wings 6.5
 cola 2.5
 fanta 2.5
 => nil
2.6.5 :004 > order.add("burger", 2)
 => "2 burgers added to basket"
2.6.5 :005 > order.add("fries", 3)
 => "3 fries added to basket"
2.6.5 :006 > order.add("cola", 1)
 => "1 cola added to basket"
2.6.5 :007 > order.view_basket
2 x burger @ 10.0: 20.0
 3 x fries @ 4.0: 12.0
 1 x cola @ 2.5: 2.5
 => 34.5
2.6.5 :008 > order.checkout(34.5)
SM656a809917944a60a9084db96fb8a504
 ```

## Running Tests

This project is setup with the following testing frameworks:

- RSpec
- RuboCop
- SimpleCov

To run the tests:
```
$ bundle exec rspec
$ bundle exec rubocop
```

## Criteria for Building the Project

The program was bulit using the below domain model and user stories:

#### Domain Model

|  Objects | Messages  | Attributes |
|:---|:---|:---|
| Order | view_menu, add(dish, quantity), view_basket, checkout(total) | |
| Basket | update(dish, quantity), update_subtotal(dish, quantity), print | subtotal |
| Menu | view, dish_available?(dish), dish_price(dish) | items |
| OrderConfirmation | send_message | |

#### User Stories
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

#### Acceptance Criteria

- [x] Ensure you have a list of dishes with prices
- [x] Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
- [x] The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
- [x] Use the twilio-ruby gem to access the API
- [x] Use the Gemfile to manage your gems
- [x] Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
