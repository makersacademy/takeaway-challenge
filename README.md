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

Motivation --
-----

Build a Takeaway program that offers an easy way for users to order their food, check their order and view the total cost. 

User Specification --
-----

We have a request from a client to write the software to design an application that allows users to order takeaway food. The user can view a menu to see all of the items and their prices. Once the user would like to select their meal they can use the takeaway program to order food, view their basket and view the order total. Here are the user stories that we worked out in collaboration with the client:

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

Process -
-----
To structure my design I first looked at extracting the messages and objects available from the user stories. Next I built out my design using wireframing and sequence diagrams to decide how I would be storing the menu and accessing the items and their prices. 

I followed a TDD approach to build out my project. Making sure that each method was working before moving onto the next. 

Challenges - 
-----

Further challenges faced with RSpec. My next focus will be drilling down on Mocks, spies and doubles to help improve my tools available for TDD.

Trying to access the takeaway menu inside of the Takeaway class and difficulties faced extracting the key / values to store inside the users basket.

Edge cases considered -
-----
* Users can only select items available on the menu
* Meal value resets on entering total to avoid duplicating total_cost

Criteria met -
-----
* All tests passing
* High [Test coverage] (100.00%)
* The code is elegant: every class has a clear responsibility, methods are short etc. 
* Code meets Rubocop guidelines

What I've learnt - 
-----
* Dependency injection for methods from different classes
* How to plan my desing using Domain Modelling
* IRB to de-bug

How to run - 
-----
Program created in Ruby. Can be ran directly from terminal, or inside IRB. (Follow install steps - https://github.com/ruby/irb)
