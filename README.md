# Takeaway Challenge

**Makers Academy - Weekend Challenge 2**

Our second weekend challenge. We were tasked to build a simple CLI app in Ruby to order food, and get the Twilio gem to confirm your order by text.

## Approach

This is arguably the most important repo throughout my Makers Academy journey. I struggled to get this app where I wanted it to be. It was a case of rushing into it without breaking down user stories. I learnt a few key points before coding such a program.

#### To Do
- [ ] Simplify/Delete the user interface
- [ ] Interface the app with the twillio gem
- [x] Remind myself why it is important to break down a problem before jumping in

## Installation

Clone repository:
```
$ git clone https://github.com/makersacademy/takeaway-challenge.git
$ cd takeaway-challenge
```

Install dependencies with bundle:
```
$ gem install bundler
$ bundle install
```

## Testing
Tests were designed and run using the RSpec framework.

To install the RSpec gem:
`gem install rspec`

To run RSpec test:
`rspec`

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
