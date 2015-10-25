Takeaway Challenge [![Build Status](https://travis-ci.org/hsheikhm/takeaway-challenge.svg?branch=master)](https://travis-ci.org/hsheikhm/takeaway-challenge) [![Coverage Status](https://coveralls.io/repos/hsheikhm/takeaway-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/hsheikhm/takeaway-challenge?branch=master)
==================

* [Task](#task)
* [My Approach](#my-approach)
* [Feature Test Sample](#feature-test-sample)

Task
-----
* Write a Takeaway program with the following user stories:

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

My Approach
------------




Feature Test Sample
--------------------
***New Takeaway Object:***
```
2.2.3 :001 > takeaway = Takeaway.new
```
***User can see the menu:***
```
2.2.3 :002 > takeaway.read_menu
 => {"Spring Roll"=>0.99, "Fried Prawn"=>2.99, "Egg Fried Rice"=>1.99, "Prawn Cracker"=>0.79, "Sweet and Sour Fish"=>3.99, "Chilli Chicken"=>4.99, "Noodle Soup"=>2.99}
```
***User can place an order and specify quantity:***
```
2.2.3 :003 > takeaway.place_order("Spring Roll", 2)
 => "2x Spring Roll(s) added to your basket."
2.2.3 :004 > takeaway.place_order("Egg Fried Rice", 5)
 => "5x Egg Fried Rice(s) added to your basket."
```
***User can see their shopping basket:***
```
2.2.3 :005 > takeaway.basket_summary
Spring Roll x2 = £1.98, Egg Fried Rice x5 = £9.95
```
***User can see the total cost:***
```
2.2.3 :006 > takeaway.total_cost
 => "Total Cost: £11.93"
```
***User can checkout their order and will receive SMS confirmation:***
```
2.2.3 :007 > takeaway.checkout(11.93)
 => "You will shortly receive an SMS confirming your order."
```
