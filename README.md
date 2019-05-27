Takeaway Challenge
==================
Makers Academy

Week: 4 - Object Orientated Design

Project: Takeaway challenge

Purpose: Friday challenge

Date: 24/05/19

Author: Lin Trieu

Self-assessment: AMBER

Challenge
-------
* Link to original challenge instructions: https://github.com/makersacademy/takeaway-challenge/blob/master/README.md

User stories
-------
* This is a Takeaway program with the following user story requirements:

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
Approach to challenge
-------
* Designed the responsibilities of each class:
  * Menu class defines the takeaway items available and displays menu items with prices
  * Order class allows items from the menu class to be added to a basket summary and calculates a total order price
  * Takeaway class enables the order to be checked out and a confirmation text message to be sent

* Test Driven Development approach adopting a Red - Green - Refactor unit testing (RSpec) process by feature 
