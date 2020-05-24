
# Domain Model Diagram

## Objects & Messages table

| Objects    | Messages      | 
| ---------- |:-------------:| 
| Customer   |  order(x,y,z) |
| Menu       |  list_dishes  |   
| Order      |  verify_order |  

## Diagram

[Input diagram here]

---
## User Story 1

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
> A customer can request to see menu from a takeaway.

 - Feature test: create new takeaway menu. *test failed*
 - Write test: Describe Takeaway object. *test failed*
 - Write code: Define Takeaway class. *test passed*

**Feature test passed.**

>  A customer can request to view dishes on takeaway object
 - Feature test: send message view_dishes to new takeaway menu. *test failed*
 - Write test: method view_dishes repsonds to takeaway object. *test failed*
 - Write code: defined view_dishes method in takeaway class. *test passed*

**Feature test passed. Customer can request to view dishes**

> A takeaway will return a list of dishes with prices

 - Feature test: view_dishes will return list of dishes with prices. *test failed*
 - Write test: view_dishes to return 1 dish with price in hash format. *test failed*
 - Wrote code: Added return value to the view_dishes method. *test passed*

**Feature test passed. Customer can view a list of the takeaway dishes**

---
## User Story 2

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
> A customer can place an order at the takeaway

 - Feature test: place order on the takeaway object. *test failed*
 - Write test: place_order can respond to takeaway object. *test failed*
 - Write code: Define place_order method. *test failed*
 
**Feature test passed. Customer can place order**

> A customer can select dishes whilst placing order.

 - Feature test: place order with selected dishes. *test failed*
 - Write test: place_order can accepts mulitple arguments. *test failed*
 - Write code: added "(*)" to place_order method. *test passed*

**Feature test passed. Customer can select dishes to order**

---

## User Story 3

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

> The takeaway will create a new customers order after being placed

 - Feature test: customer order is created after order is placed. *test failed*
 - Write test: place_order will return new Order object. *test failed*
 - Write code: defined Order class and required the file into takeaway.rb. Added place_order to return an instance of Order. *test failed*
 - Rewrite test: place_order will return instance of the Order class. *test passed*
 
 **Feature test passed. A new order is created once a customer's order is placed.**

> The customers can view the selected dishes in their order.

 - Feature test: customers order to store selected dishes. *test failed*
 - Write test: describe Order which responds to customers_order. *test failed*
 - Write code: defined the method customer_order. *test passed*
 - 

















```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```


