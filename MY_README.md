Takeaway Challenge
==================

Task Summary
-------------

The purpose of this challenege is to make a simple program that allows a customer to place an order from the menu for a takeaway meal to be delivered. We will check the order sum matches the number of meals the customer has ordered and then send a text message to the customer to say there order will be deliverd 1 hour from when order was placed.

Domain Model
-------------

User Story 1
-------------


   Object  |   Message
---------- | -----------------
Customer   |
Order      | food_and_drink
Dishes     | prices

User Story 2
-------------


   Object       |   Message
--------------- | ------------------------
Customer        |
Order           | food_and_drink
AvailableDishes | select_number_of_dishes

User Story 3
-------------


   Object    |   Message
------------ | ----------------------------
Customer     |
Order        | correct?
TotalOrder   | match_sum-of_dishes_ordered

User Story 4
-------------


   Object   |   Message
----------  | --------------
Customer    |
Delivery    | text_message