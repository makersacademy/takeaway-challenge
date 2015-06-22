Takeaway Challenge
==================
USER STORIES

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

Completed:

Started by using irb to work out a rough plan of how I would like the program to operate. 
Built up functionality using TDD and OOD, creating a Takeaway class and a Texter class (which interacts with Twilio)

I managed to implement the majority of the functionality for the takeaway - the menu can be checked, items can be added to the order and there's the ablity to check current order summary and pay. 
The program will not allow you to 'pay' anything other than the calculated total, and once you have 'paid' it wipes the order summary and running total of costs so you can't accidentally pay twice.

The program also automatically sends you a text message with the estimated time of delivery (1 hr from time of order) once you have 'paid'.

Unresolved:

I have not managed to implement tests correctly for my Texter class. I really struggled with getting the interaction with Twilio working and wasn't able to work out how to stub the test.

I am also aware that my Takeaway class has a lot of methods. I think I managed to refactor the methods within the class quite well but I should probably move the MENU hash and check_menu method into a separate class and work out how to refer to them from the Takeaway class. 

I tried to use dependency injection to resolve dependency on the Texter class, but broke all my tests in the process and was unable to resolve - would really appreciate some help with this.


[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
