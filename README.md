Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  N.P. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

This app allows customers to order a takeaway from a restaurant menu. Once their order has been confirmed they are sent a confirmation text message. The app satisfies the following user stories:

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

Getting Started
---------------

`git clone git@github.com:n-ckr-ch-rds-n/takeaway-challenge.git`
`bundle`

Usage
-----

`irb`
`require ./lib/restaurant.rb`

Running Tests
-------------

`rspec`
Feature test/sim file at `./lib/takeaway_sim`

