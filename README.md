Takeaway Challenge  
==================
  ```
                      ____  
                       /  \
                       \__/                    
                  /=== |  | _________
              r==/     |  | |       |
           _  //       |  | | Deli  |   ))))-----
          |_)//(''''': |  | | Foood |
            //  \_____:|__|_.-------D     )))))-------
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))----------
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

 Project completed and all tests are passing, I couldn't find a way to stub the Twilio API inside the message class and finally excluded it. This explains the low test coverage of 92%.

 It behave as expected from the terminal.

 If I had more time, I would've delegated the order basket into its own class for the sake of adhering more strictly to the single responsibility principle.

 I feel I have respected the rule of keeping each object as separate as possible from each others, using encapsulation.

The project has been made with ❤️ from France for the weekend challenge of week 2 at Makers Academy.


 Instructions
 ============
 1/ Clone this repo by running git clone
 git@github.com:tbscanlon/takeaway-challenge.git from your terminal

 2/ Navigate to the project folder: cd takeaway-challenge/.

 3/ Install dependencies by running bundle install (you may need to gem install bundle).

 4/ You will have to create a twilio account: https://www.twilio.com/




Project User Stories
===================
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
