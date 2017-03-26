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

### Task

I aimed to write a program to satisfy the following user stories:

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
I first broke down the user stories using domain modelling. My resulting models were then converted into failing feature tests, then translated into RSpec as failing unit tests. Following that, I wrote my code.

I aimed to complete this challenge by using a test-driven approach, using manual feature tests within PRY and automated unit tests using RSpec.

Care has been taken to ensure encapsulation was done as much as possible, so that the user (Customer) can only interact with an instance of the Interface class.

I used the [Twillo API](https://www.twilio.com/docs/api/rest) to enable my program to send confirmation texts to mobile phones.

### Installation

Clone repository:
```
$ git clone git@github.com:nazwhale/takeaway-challenge.git
$ cd takeaway-challenge
```

Install dependencies with bundle:
```
$ gem install bundler
$ bundle install
```

### Example of use

To make an order, then take it off again in IRB:

```
$ pry
$ require './lib/takeaway'
=> true
$ i_need_sushi = Takeaway.new
Greetings, Welcome to Ruby Sushi!
--------------
Todays's Menu:
--------------
Edamame: £2
Kaiso: £4
Maki: £4
Nigiri: £3
--------------

What would you like to order? Enter 'done' when you are happy with your selection
Dish: kaiso
Quantity: 2
Dish: maki
Quantity: 1
Dish: nigiri
Quantity: 4
Dish: done
--------------
Your order:
--------------
2x kaiso @ £4
1x maki @ £4
4x nigiri @ £3
Total: £24
Is this correct? (y/n)
y
```

### Domain model

Functional representation:

| Objects                  | Messages                 |
| ------------------------ | ------------------------ |
| Menu                    | display         |
| Interface                  | welcome           |
| Interface                    | total_correct?         |
| Order                    | take_order          |
| Calculator                  | total_order            |
| Text                    | send_text        |
