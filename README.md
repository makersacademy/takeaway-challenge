[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/makersacademy/takeaway-challenge/badge.svg)](https://coveralls.io/github/makersacademy/takeaway-challenge)


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

User stories used to build this code:

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

Note; the walkthrough guidance advised asking the customer for the total and only placing the order if that is correct. Instead, I have impleted a 'total' method to allow a customer to see their total balance.

##How to use##

```shell
require './lib/takeaway'
t = Takeaway.new
t.show_menu #will show menu list
t.order("item", quantity) #place an order by giving the item name and the quantity. Defaults to 1 if no quantity is given
t.basket #shows the current order
t.total #shows the total price for the order
t.place_order #will send a text message to the test number
```
## Approach ##

I decided to make the menu and ordering functionality as simple as possible, to allow time to focus on setting up the text messaging functionality. If I had more time I would have worked on using gets to capture order items and quantities, and making sure all edge cases were covered. Test coverage dropped to 95% on implementation of Twilio, I am not sure how to write tests for this functionality.

## Library ##

./lib/
  - takeaway.rb
  - menu.rb
  - text_message.rb

./spec/
  - takeaway_spec.rb
  - menu_spec.rb
  - text_message_spec.rb
