# Takeaway challenge
## Makers - Week 2 - Weekend challenge

This challenge is to create a takeaway app that integrates with Twilio to send SMS order confirmations.

This will be written in Ruby and implemented using test driven development using the Rspec framework.

## Progress report

  - Text and time working! Time not yet tested
  - Disclaimer - I had some help writing my Rspec test for sms
  - Still to do - create order class and split takeaway/order
  - Still to do - use Timecop to add time +1hr to sms message
  - Still to do - deal with edge cases eg negative quantities in orders

## User stories

> As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

> As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

> As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

> As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you

## How to use

I have designed this app in such a way that it should be reusable for any takeaway, assuming a user interface will be set up later - as such there is no hard-coded menu. This means that as is, the user interface is irb and so the takeaway must be set up as follows (note: this is an example menu and any chould be used in this format): ...... TBC