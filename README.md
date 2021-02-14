# Takeaway Challenge]

[![Maintainability](https://api.codeclimate.com/v1/badges/79727ec5f4c93807146c/maintainability)](https://codeclimate.com/github/AJ8GH/takeaway-challenge/maintainability) [![Build Status](https://travis-ci.com/AJ8GH/takeaway-challenge.svg?branch=master)](https://travis-ci.com/AJ8GH/takeaway-challenge)

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

## Getting started

Clone
- `git clone git@github.com:AJ8GH/takeaway-challenge`

Install dependencies
- `bundle`

cd into root folder
- `cd takeaway-challenge`

run takeaway script
- `ruby takeaway.rb`

## Dependencies

- `ruby 2.6.5`
- `twilio-ruby`
- `dotenv`
- `rspec`
- `rubocop`
- `coveralls`
- `rake`

## How to use

- examples

## Techniques applied

- Automated messaging: programming sms message sending through Twilio messaging client
- Domain modelling: translating user stories into sequence digrams into code
- TDD
- OOD: SRP, Encapsulation, Dependency injection, Polymorphism

Reflections

- what went well
- what to do differently

## User stories

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
