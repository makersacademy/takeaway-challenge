# Takeaway

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
[![Coverage](./badge.svg)](https://github.com/lukestorey95/takeaway-challenge)

This program allows the user to order a takeaway, and receive a confirmation text informing them when to expect delivery. It uses a takeaway controller, order system, menu that loads dishes from a .csv file and TwilioAPI to send the text messages.

<br>

## Installation

```
$ git clone https://github.com/lukestorey95/takeaway-challenge.git

$ cd takeaway-challenge

$ bundle

$ source ./twilio.env
```

<br>

## Quickstart

```
$ irb

> Dir['./lib/*.rb'].each {|file| require file }

> takeaway = Takeaway.new

> takeaway.display_menu

> takeaway.add_to_order({ pizza: 9.50 })

> takeaway.check_order

> takeaway.place_order
```

<br>

## Running Tests

```
$ rspec

# The integration test is pending as running it will public send a text (costs 6p per text)
```

<br>

## My Process

1. Break down user stories into objects, attributes and behaviour
2. Feature test and note down errors/expected errors
3. Write failing test that replicates errors
4. Write the minimum code to make test pass
5. Refactor and ensure tests still pass
6. Repeat step 2 and ensure behaviour works as intended

<br>

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