Takeaway Challenge
==================

Task
-----

Create a programme to satisfy the following user stories:

```sh
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

Completed
-----
  * have a list of dishes with prices
  * a customer can place an order by giving the list of dishes and their quantities
  * allow customer to view order summary and total price of the order.
  * allow customer to place order and receive a text message as confirmation and a delivery time one hour after the order is placed.

Future Tasks
-----
  * currently, a customer has to choose a restaurant's menu to view before being able to choose dishes and place an order, which may not be the best approach.
  * create a user interface.

Considerations
-----
  * ensure Object Oriented design
  * focus on Test Driven Development
  * implement the Single Responsiblity Principle
  * use Dependency Inversion

Class Responsibility Collaborator
-----
**class Customer**

| Resposibility | Collaborators |
|:---------------|:---------------|
|View the menu| Restaurant |
|Choose dishes | Menu |
|Choose number of dishes | |
|Place order | |
|View order | |

**class Restaurant**

| Resposibility | Collaborators |
|:---------------|:---------------|
|Hold orders| Customer|
|Calculate total | Menu |
|Check orders are valid| |

**class Menu**

| Resposibility | Collaborators |
|:---------------|:---------------|
|Know dishes| Customer|
| | Restaurant |



[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
