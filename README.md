Welcome to Savanna's Takeaway
=============================
```
                            _________
              r==           |       |
           _  //            |  savs |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
Ooh helloo!
In this challenge, the task was to create a Ruby takeaway application, whereby the customer can view a menu, select dishes, place an order and receive a deliver confirmation text.
This application was developed by TDD using RSpec, making use of mocking to prevent external dependencies, and adheres to the single-responsibility principle of OOD.
I used the Twilio API to send text messages and exercised encapsulation, dependency-injection and abstraction. I hope you like it!



Task


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
