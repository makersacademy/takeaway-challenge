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

 In this challenge my 'client' has instructed me to create a program that allows a user to view and order dishes as well as receive a text message from the restaurant letting them know that their order will be with them in one hours time.

Approaching the challenge
-------
**User story one:**
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
From reading this user story and focusing on the last line in particular I can see the nouns are 'dishes' and 'prices' and the sole verb used is 'list'. After drawing a UML class diagram in my notes I have decided that my class will be called 'Restaurant' and I will need the variable 'dishes_with_prices' and the method 'list'. 'Dishes_with_prices' is hash that holds key => value pairs of each dish and price.

**User story two:**
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
In this user story the nouns are 'dishes' and the verbs are 'select'. To accomplish the user story I'm, going to create a method called 'select' that, when called, should enable the user to list the dishes they want to order.

**User story three:**
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
For this user story I am placing 'sum' as my variable and 'total' as my method. The user will be able to call the method 'total' and get the amount their order has come to. Each time the user adds a dish to their order my variable, 'sum', will keep track of the order amount and output it to the screen.

**User story four:**
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
The final user story requires me to allow the user to receive a message on when they can expect their order. The nouns are 'text' and 'order' and the verbs are 'receive' and 'ordered'. I plan to create a new class called 'Phone' with the variable 'text' and the method 'receive'. 

Reflection
-----
I really enjoyed making this project and creating a 'restaurant' concept.
I struggled to work out how to use the Twilio API to send text messages but will come back to this later and edit it so that the program completes the final expectation. 

