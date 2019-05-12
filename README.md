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
A project that creates a Takeaway program that will take an order and send a confirmation text message. 

The aim of this challenge is to - 
- Practice TDD - use feature and unit tests from the begining (these can be seen in thee process.md file)
- Keep the code is elegant: every class has a clear responsibility, methods are short etc. (SRP)
- Using the Gemfile to manage gems
- Use the twilio-ruby gem to access the API

User Stories 
-------

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

Status 
-------
- I have managed to complete the third User Story. 
- All tests are passing
- 100% test coverage
