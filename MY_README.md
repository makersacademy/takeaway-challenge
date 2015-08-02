Takeaway Challenge
==================

Task Summary
-------------

The purpose of this challenege is to make a simple program that allows a customer to place an order from the menu for a takeaway meal to be delivered. We will check the order sum matches the number of meals the customer has ordered and then send a text message to the customer to say there order will be deliverd 1 hour from when order was placed.

Domain Model
-------------

User Story 1
-------------

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

   Object  |   Message
---------- | -----------------
Customer   |
Order      | food_and_drink
Dishes     | prices

User Story 2
-------------

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

   Object       |   Message
--------------- | ------------------------
Customer        |
Order           | food_and_drink
AvailableDishes | select_number_of_dishes

User Story 3
-------------

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

   Object    |   Message
------------ | ----------------------------
Customer     |
Order        | correct?
TotalOrder   | match_sum-of_dishes_ordered

User Story 4
-------------

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

   Object   |   Message
----------  | --------------
Customer    |
Delivery    | text_message