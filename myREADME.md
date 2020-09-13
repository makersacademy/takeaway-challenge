Writing a Takeaway Program 
----------
Steps - create a class diagram explaining functionality
TDD approach for classes 
Before I commit always run rubucop
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

User Story 1
--------
Each Dish should have a price attribute 
Can have a dish class that stores this 
Then can have a menu class which uses a dish class object through composition 

User Story 2
----- 
Each dish can have a quantity attribute for the number of items to order

User Story 3
----- 
Have a method that calculates the total cost of all dishes ordered 
Should have a order class responsible for calculating this and uses a menu object

User Story 4
----- 
Have a method to send a text to the phone confirming a order when its placed in the order class. 