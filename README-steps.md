
# Domain Model Diagram

## Objects & Messages

| Objects    | Messages      | 
| ---------- |:-------------:| 
| Customer   |  order(x,y,z) |
| Menu       |  list_dishes  |   
| Order      |  verify_order |  

## Diagram

[Input diagram here]

## User Story 1

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
> customers request to see menu from takeaway.

 - Feature test: create new takeaway menu. *test failed*
 - Write test: for Takeaway object. *test failed*
 - Write code: Define Takeaway class. *test passed*
 - **Feature test passed**


> customer can request to view dishes on takeaway menu
 - Feature test: send message to view_dishes to new takeaway menu. *test failed*
 - Write test: define the method view_dishes. *test failed*
 - Write code: defined view_dishes method. *test passed*
 - **feature test passed**








```
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


