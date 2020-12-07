## Takeaway Challenge
A small takeaway app, built in ruby.
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```


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

## Motivation
A project used to test the ability to test drive a simple app, using OOD and demonstrating Single Responsibility Principle, ensuring tests are isolated using mocking.

## Build status
Partially Complete. No user interface. Plus [Twilio](https://www.twilio.com/) integration functionality is disabled.

## Tech/framework used
Ruby + Rspec

## Features
Integration with [Twilio](https://www.twilio.com/) to enable text message confirmation of order.

## Installation
Can run in IRB with `irb -r './lib/takeaway.rb'`

## API Reference

Twilio API reference documents live [here](https://www.twilio.com/docs/api)

## Tests
Unit tests can be run with `rspec`. All tests are passing, with 100% coverage.
