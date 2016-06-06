# Takeaway Challenge

[![Build Status](https://travis-ci.org/riyapabari/takeaway-challenge.svg?branch=master)](https://travis-ci.org/riyapabari/takeaway-challenge)


Weekend 2 Challenge: Created a program that allows a customer to view a menu, order dishes, and receive a text confirmation upon confirming their order using the Twilio API. (See Makers Academy brief & user stories below.)

## Installation Instructions

1. Clone repo to your local machine
2. Install Ruby version 2.3.1 if you don't have it already: `rvm install ruby-2.3.1`
3. Use RVM to use Ruby version 2.3.1: `rvm 2.3.1`
3. Run `gem install bundle` if you don't have bundle already
4. Run `bundle`

## How to Use

1. Run `irb`
2. Require `./lib/takeaway`
3. To initialize your takeaway: `takeaway = Takeaway.new`
4. To view the menu: `takeaway.view_menu` (hope you like Japanese!)
5. To add a dish to your order: `takeaway.add_to_order("edamame", 2)`
6. To view your order: `takeaway.view_order`
7. To checkout: `takeaway.checkout`
8. To confirm your order: `takeaway.confirm_order('£3')`
9. You should receive a text shortly.. bon appetit!

## Makers Academy Brief

### User Stories

Write a Takeaway program with the following user stories:

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
