# Takeaway Challenge
(https://github.com/makersacademy/takeaway-challenge)

## About
As part of Makers Academy week 2 Weekend challenge the software for a takeaway shop will be created. ......................

## Current Status


## How to use
ADD ADD ADD ADD ADD

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

# User Stories, Feature Tests and required Domain Models

## User Story 1
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
## Feature Test 1
```
takeaway = Takeaway.new
takeaway.show_menu

```

## Domain Model
| Object | message |
| -     | -         |
| Takeaway| show_menu |
| Menu | list |

## User Story 2
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
## Feature Test 2
```
card = Card.new
card.top_up(10)
```

## Domain Model
| Object | message |
| -     | -         |
| Card | balance |
|     | top_up(amount)  |

## User Story 3
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
## Feature Test 3
```
card = Card.new

card.top_up(90)
OK

card.top_up(91)
RAISES ERROR

```

## Domain Model
| Object | message |
| -     | -         |
| Card | balance |
|     | top_up(amount)  |

## User Story 4
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
## Feature Test 4
```
card = Card.new
card.top_up(10)
card.deduct(5)
```

## Domain Model
| Object | message |
| -     | -         |
| Card | balance |
|     | top_up(amount)  |
|     | deduct(amount)



## Focus goals

Mindful engagement with these challenges can help you achieve these goals:

###  I write code that is easy to change

Writing easy to change software is highly prized amongst developers and employers. By developers because most of a developer's time is spent changing software. By employers because their teams can deliver value to customers faster.

###   I can test-drive my code
Tested software is easier to change because you can tell when it's broken just by running a command, even the tricky edge cases.

###  I can build with objects
Most code in the world is structured in small pieces called objects. This is done because it is easier to change than having everything in one place.</dd>


# Goals this will help me with:
* I can TDD anything
 EXPLAIN HOW THIS WILL HELP?? (ie followed red, green refractor)
* I can program fluently
EXPLAIN HOW THIS WILL HELP?
* I can debug anything
EXPLAIN HOW THIS WILL HELP?

## Status images ##
(https://docs.travis-ci.com/user/status-images/)
NEEDED???????
