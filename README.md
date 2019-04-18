# Takeaway-challenge

## Technologies used
- Ruby
- Rspec

## Setup instructions
* Run the command 'bundle' in the project directory to ensure you have all the gems
- To run tests: rspec

## TASK SUMMARY


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
* Hints on functionality to implement:

Ensure you have a list of dishes with prices

Place the order by giving the list of dishes, their quantities and a number that should be the exact total. 

If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".


The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
Use the twilio-ruby gem to access the API
Use the Gemfile to manage your gems

Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run

However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.


## APPROACH

**Drew diagram to illustrate domain modelling**

- idea/diagarm generation

- 2 objects- takeaway, dishes

- 3rd object- message

- Takeaway - (select dish/ place order) - leads to send message, (display/checks total price matches with dishes), method: place order?, see_menu, 


- dishes -  (displays prices of all dishes), @price, @name


- sendmessage - (sends message, twillo)
(use mock for takeaway?  or mock for sendmessage)


## Write tests for each user story

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
````

Tests: 
takeaway class:
order would return a list of dishes with prices and name

dishes class:
returns list of dishes with prices and name


````
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
````

````
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
````

Tests: 
selecting dishes would return dishes selected and total
 
Checks wether total amount given(by user) of selected dishes matches with sum of order

````
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
````

Tests: 
Receives text message that it would be delivered if amount matches



## What i didn't do:

-Use mock so that texts are not sent when texts are run

