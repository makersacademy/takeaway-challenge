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

Features
-----

* Print Menu
* Make an order
* Verify order
* Receive Text confirming order

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

Approach
-----
A test driven approach was taken in order to complete this challenge. For each use case, a feature test was written followed by unit testing using RED-GREEN-REFACTOR method. The tests for each class are isolated using doubles, mocks and stubs in order to ensure a scalable and easily modifiable code base.

The code has four classes:
* Customer Order: allowing customer to select dishes, with required validation
* Menu: pulls data on available dishes and prices and validates if customer has selected a valid dish
* Bill: calculates required payment based on the menu prices and customer order
* Text: creates connection with Twilio and sends text confirming order

Getting Started
-----
```
git clone path-to-your-repo
```
```
bundle
```
Running Tests
-----
```
rspec
```
