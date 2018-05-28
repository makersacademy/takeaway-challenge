# Take Away Challenge

### [Makers Academy](https://www.makersacademy.com) - Week 2 Pair Programming Project

## Outline
This program mimics the behavior of a takeaway delivery service. The user is able to view a menu, submit an order request, confirm that the total is what they expected and receive an SMS message confirming that their order has been received and the appromixate delivery time. This project uses Twilio to send SMS messages. 

## The Task
I used this project to practice TDD, OOP, and implementing third party functionality. I also used this project to practice writing an integration test (as opposed to only writing unit tests, which is what I had done in all my other projects leading up to this point). To further improve this code, I would write additional unit tests for the SMSSender class.  

## User Stories
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
