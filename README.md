Takeaway Challenge
==================

Task
-----

* Write a Takeaway program with the following user stories:

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
Approach
-------
* Modelled the Takeaway based on a primarily dual object relationship between a Customer object and a Takeaway object.  The Customer object was designed as a wrapper with public facing method calls that link to the relevant Takeaway actions.
* In supplementary version (Takeaway:Approach 2) I have experimented with a different design that utilises a broader range of class objects
* The Takeaway object is injected into the Customer object using yield to avoid dependency and operate as an attribute within Customer.
* The Takeaway itself manages the menu and orders through list based data structures - elected not to design separate objects as for this simple program neither the menu nor the order required any distinct attributes or method calls.
* Incorporated Twilio API to enable the Takeaway to send a text message when a customer has confirmed their order.  Message sending is handled by an encapsulated Twilio Sender object.

Status
-------

* All tests passing locally and text message received when confirm_order function is called.
* Tests successully stub out Twilio API for testing purposes.

