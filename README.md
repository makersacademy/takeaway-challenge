# Takeaway Challenge
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

## Task
I have been asked to write a Takeaway program that will include a menu with a list of dishes with their respective prices. People will be able to use the program to place their orders, via selecting the dishes they want and their respective quantities. The program will work out the total cost of their order and I will use Twilio in order to send text messages to let people know when their order will be ready. During testing, I will try to use stubs and doubles in order to isolate my tests.


## Instructions

Clone this repository to your desired location, run the command `gem install bundler` then run `bundle`.\
\
Run RSpec in the `takeaway_challenge` directory whilst in the terminal in order to run the unit tests.\

## User Stories
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

## Domain Model Diagram

| name      | takeaway                  | order                          | menu                      | twilio                    |
| ----------| ------------------------- | ------------------------------ | ------------------------- | ------------------------- | 
|           |                           | @order: hash, reader           | @menu: hash, reader       | @app_token: string, hidden|
| variables |                           |                                |                           |
|           |                           |                                |                           |                           |
| ----------| ------------------------- | ------------------------------ | ------------------------- | ------------------------- |
|           | take_order                | add_to_order(item, quantity)   | show_menu                 | send_message(to)          |
| methods   |                           | receipt                        |                           |                           |
|           |                           | place_order                    |                           |                           |
|           |                           |                                |                           |                           |
| ----------| ------------------------- | ------------------------------ | ------------------------- | ------------------------- |

Initial ideas regarding what classes will be needed with which instance variables and methods.

## References
``` 
https://www.ellehallal.dev/blog/2018/11/2018-11-16-testing-user-input-with-rspec/
https://www.twilio.com/docs/libraries/ruby 
```
used the above in order to stub user input
used the above in order to implement the text message functionality
