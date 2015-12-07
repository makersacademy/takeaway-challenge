Takeaway Challenge
==================

Task
-------

We have a request to create a Takeaway program that allows customers to see the menu from a restaurant, select dishes from that restaurant and make an order. The completion of this process will be confirmed via sms.

User stories
-----
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

How I Worked
-----
I first determined the objects and messages that the program would need to contain by sketching interactions between the different parts mentioned in the user stories. Following the Single Responsibility Principle led me to have four classes:

-Menu
-Order
-Message (sms functionality was integrated using Twilio)
-Takeaway

Once the classes and corresponding responsibilities had been established
