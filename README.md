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
User Stories

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

My solution

* A menu is created using a hash of dishes and their prices
* A new order instance can be created for a specific menu
* Dishes and their quantities can be added to orders one at a time
* To complete/close the order, the user must provide the correct total
* When an order is completed, the user receives an SMS
* I used Twilio to set up the SMS functionality
* I set up a feature test for the entire app. Please note all Twilio
authentication information is stored in environment variables on my local
machine, so tests pertaining to Twilion/SMS functionality will not pass elsewhere.

Running the program

Run this program from irb. Run the tests using rspec. Use bundler to install
required gems, listed in Gemfile.
