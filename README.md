Week 4 - Takeaway Challenge
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

 This challenge uses:
 - Ruby
 - Twilio
 - Rspec

This challenge was to convert the following user stories into a 'functioning' Takeaway using classes and methods, whilst using the TDD approach. The goal was also to take OOD into consideration when deciding how to split the code up into classes and methods, where to refactor, use SRP and more. The challenge I faced is using environment variables to use within my code, to store my Twilio credentials.

---------------------

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

------------------

To run code:
$ git clone https://github.com/AishaDorsett/takeaway-challenge.git
$ cd takeway-challenge
$ bundle install
$ irb > 'require./lib/*each file*'