# Takeaway Challenge
Create a basic takeaway ordering system, containing a menu of items and prices, which allows the user to place an order and to receive text confirmation of that order.

## Motivation for Project
Weekend challenge for the end of week 2 of Makers Academy.

## Skills Practised
RSpec, incl mocking & doubles, linking to an API.

## How the code works
*insert sample run-through here*

## Challenge status
Initial review of user stories completed, notes made on types of objects to create.

## Steps to finish challenge
*update last, showing what you would do next to complete challenge*

## User Stories & task planning

> As a customer
> So that I can check if I want to order something
> I would like to see a list of dishes with prices

Need to return a menu when requested.  
Objects: customer, menu (list of dishes)  
Actions: view_menu
Notes:
* create a list of dishes with prices - a hash sounds best

> As a customer
> So that I can order the meal I want
> I would like to be able to select some number of several available dishes

Need to be able to place order for several dishes  
Objects: customer, order  
Actions: place_order

> As a customer
> So that I can verify that my order is correct
> I would like to check that the total I have been given matches the sum of the various dishes in my order

Need to check that total is correct  
Objects: customer, order, total  
Actions: check_total

> As a customer
> So that I am reassured that my order will be delivered on time
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

Need to receive a text advising that the order will be delivered before one hour from now. Need to link to current time! Need to utilise Twilio API (text message API).  
Objects: customer, order  
Actions: order_acknowledgement(via text)  
Notes:
* register for Twilio
* update Gemfile to include twilio-ruby gem
* use own mobile number - make this private & don't push to GitHub  
* also need to keep Twilio API key private - check how to do this on GitHub
* tests shouldn't send texts, so use mocking or stubs here
