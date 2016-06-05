# Takeaway Challenge

Weekend 2 Challenge: Created a program that allows a customer to view a menu, order dishes, and receive a text confirmation upon confirming their order using the Twilio API.

## My Solution

```
1. Clone this repo to your local machine
2. Run 'gem install bundle' if you don't have bundle already
3. Run 'bundle'
3. Run 'irb'
4. Require './lib/takeaway'
5. To initialize your takeaway: takeaway = Takeaway.new
6. To view the menu: takeaway.view_menu (hope you like Japanese!)
7. To add a dish to your order: takeaway.add_to_order("edamame", 2)
8. To view your order: takeaway.view_order
9. To checkout: takeaway.checkout
10. To confirm your order: takeaway.confirm_order('£3')
11. You should receive a text shortly.. bon appetit!

```

[![Build Status](https://travis-ci.org/riyapabari/takeaway-challenge.svg?branch=master)](https://travis-ci.org/riyapabari/takeaway-challenge)


## Makers Academy Brief

### Task

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
