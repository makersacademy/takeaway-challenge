# Takeaway Challenge

For this weekend challenge, I was tasked with implementing a restaurant takeaway system.

## User Stories / Requirements

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

## Approach

To separate the concerns, I created four main classes using TDD: **Menu**, **Order**, **Takeaway** and **SMS**.

## How to install

```
git clone {URL}
```

```
bundle install
```

## Run Tests

```
rspec
```
