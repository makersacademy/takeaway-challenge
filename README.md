# Takeaway Challenge

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

## Specification

Write a Takeaway program using the following:

### User stories
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

This project is to be implemented using a TDD process with a particular focus on testing behaviour.

- Extract domain model from user stories.
    - Categorise key nouns and verbs from the user stories into classes, properties and methods.
    - Create diagrams of the relationships between the domain model elements.
- Apply TDD process.
    1. Write failing feature test.
    1. Write failing unit test.
    1. Implement code to pass tests.
    1. Refactor
    1. Repeat until all software requirements are met.

The aim is to build a program with easy-to-use commands. The user stories will be used a base to try to achieve an efficient process of ordering a takeaway.

## Getting started

```irb
3.0.2 :001 > require './lib/takeaway'
 => true 
3.0.2 :002 > takeaway = Takeaway.new
 => 
#<Takeaway:0x00007f8c4695d538
... 
```

### How to use

After creating a new instance of a takeaway, the following commands can be used:

```
takeaway = Takeaway.new
```
`takeaway`

- `.view_menu`
- `.select()`
  - One or more numbers corresponding to dishes on the menu can be passed as arguments to `select` e.g. `select(2, 4, 5)`
- `.view_order `
  - to see a summary of your current order.
- '.order' (not yet available)
  - will place the order and send you a text comfirming your order.


## IMPROVEMENTS

A feature to allow a customer to chose the quantity of an item would make the program more user friendly.

More consideration should be given to make the structure of the tests and implementation code more efficient - aiming for low coupling and high cohesion.

#### Addtional features

An additional feature could be to allow a customer to change or remove items from their order.


#### Completion

To address the last user story, an 'order' feature would be implemented by following the documented process for using the Twilio API.