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
This program emulates a takeaway delivery service. This challenge enabled me to implement my debugging and TDD skills while using Rspec tests.

I approached this challennge in the following way:

1. Wrote out the Rspec test that showed what I was aiming for as per the user stories.
2. Ran Rspec and used the error messages to write out the source-code.
3. Repeated this process until I had a fully functional passing test.

How to Use:
-----

1. Fork this repo
2. Run the command 'bundle' in the project directory to ensure you have all the gems.

User Stories:
-----

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

