# User Stories to Domain Model

## Scenario

### 1.
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

### 2.
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

### 3.
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

### 4.
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered


## Nouns in User Stories
- customer
- takeaway
- message

## Verbs in User Stories
- view_menu
- add_to_basket
- calc_total

##  Functional representation of that story

| Objects         | Messages                              |
|-----------------|---------------------------------------|
| customer        |                                       |
| takeaway        |  create_order                                     |
| order           | badket<br>add_to_basket<br>calc_total |

## How our Objects will use Messages to communicate with one another
takeaway <-- create_order --> order
order <-- add_to_order
order <-- basket --> basket
order <-- calc_total --> total
