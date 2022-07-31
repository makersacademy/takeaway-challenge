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


This is my code for the second Makers Academy end of week challenge. The aim of this project was to build a Takeaway Ordering System; the design of which was based on the following user stories: 

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

Method
-------

Following a TDD approach, I created a number of interacting objects which form the Takeaway Ordering System. I allowed Rspec tests to guide this process. 

I first developed a simple Menu class which could be used to order items from via an Order class. The Takeaway class is for the most part, to be used as an interface while much of the logic is taken care of by the Order object. 

Improvements
-------

* One interesting feature of the software is the ability to send a confirmation SMS using the Twilio API. Given more time I would like to add the capability to order via SMS.

* I would like to add further functionality to the software such as editing/deleting items from the order.

* The software largely makes use of hashes to store data from the user. An improvement on this would be to load/save the data to/from a JSON file(s). This would allow for added features such as saving an order for future use.

Instructions
-------

A test file (test_file.rb) has been provdided, should you wish to run a pre-made demonstation. To do this, simply run "ruby lib/test_file.rb" in your terminal. You will need a Twilio account if you would like to receive a confirmation text. To do this, add your Twilio account details in the variables provided. As the default value of '@sms' is set to nil the program will still run so long as you do not provide an 'sms' argument to the take_away object: 

(Replace line 25 of the test file with: take_away = Takeaway.new(menu) )

Testing Information
-------

* Rspec: 15 examples, 0 failures
* COVERAGE: 100.00% -- 159/159 lines in 10 files
* Rubocop: 13 files inspected, no offenses detected
