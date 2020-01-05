# Takeaway

---

## Outline

---

This is one of Makers Academy's projects, which is a program for ordering Takeaway from a restaurant. The customer should be able to see the items on the menu,  place their orders, add itms, check total price and receive confirmation of their order and delivery time. These requirements have been given below in more details

## User Requirements

---
`As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices`

`As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes`

`As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order`

`As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered`

## How to Install

---
You need to fork and clone this repo to be able to install it. This program is run via the terminal, so you need to use irb.

## Gems used

---
The follwoing gems are required for this project:

* capybara
* rake
* rspec
* rubocop, 0.71.0
* implecov', require: false, group: :test
* simplecov-console', require: false, group: :test

## How to Run

---
This program is run via the command line so it needs to be loaded to the irb; follow the instructions below:

* Change into the directory this was cloned in
* Type irb and press enter
* Type the following to be able to get access to all the dependencies:

```
require './lib/takeaway.rb'
require './lib/order.rb'
```

## How to test

---
Run rspec to see the test documentation


