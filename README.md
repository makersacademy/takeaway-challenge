Takeaway Challenge
==================
[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)
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

Installation Instructions
-----
Clone the repository from [github](https://github.com/mbgimot/takeaway-challenge) and then move to that repository.

```
$ git clone git@github.com:mbgimot/takeway-challenge.git
$ cd takeaway-challenge
```

Load dependencies with bundle
```
$ gem install bundle
$ bundle install
```

Load the app in IRB
```
irb
2.3.1 :001 > require './lib/order.rb'
```

This program uses the ```twilio-ruby``` gem to send order confirmation texts. In order for them to work, the following environment variables need to be set, either in ```.bash_profile``` or using the ```envyable``` gem:

* TWILIO_SID - Twilio Account SID  
* TWILIO_KEY - Twilio Auth Token  
* TO_NUMBER - Phone number for receiving messages  
* TWILIO_NUM - Twilio-verified phone number for sending messages  

Interface
-----
Initializing a restaurant:  
```
cafe = Restaurant.new
```

Initializing a order:  
```
order = Order.new
```

Finding out the restaurant's dishes:  
```
order.view_dishes(cafe)
```

Adding items to the basket (returns updated basket):  
```
# order.select_dishes(restaurant, *dishes)
order.select_dishes(cafe, "orange_juice")
```

Viewing current basket:  
```
order.basket
```

Viewing total cost of basket:  
```
order.price
```

Completing an order:
```
order.checkout(price)
```

Contributors
-----
Mitchell Goldbay [github](https://github.com/mbgimot/) [mitchellgoldbay@gmail.com](mailto: mitchellgoldbay@gmail.com)
