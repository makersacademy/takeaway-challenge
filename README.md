Takeaway Challenge
==================
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
This programme allows a user to order a take-away from their local restaurant.

I created this programme for a weekend challenge at [Makers Academy](https://github.com/makersacademy). See [User Stories](#user-stories) for more information on the programme's requirements.


* [Getting started](#Getting-Started)
* [Useage](#useage)
* [Running tests](#Running-tests)
* [How I built it](#How-i-built-it)
* [Credits](#credits)


## Getting Started ##

To install:

```shell
example code
```

## Useage ##

- where to use
- example code 
- example output

## Running tests ##

1. Navigate to top level of project direct (path/*repo_name*)
2. In your command line type:

```shell
$ rspec
```

## How I built it ##

I used a TDD approach to build this programme, using the provided user stories to create a domain model diagram, and feature tests. From here I was able to create unit tests which drove the code I wrote.

### Still to complete ###

- Twilio API integration to send a confirmation text upon complete

### User Stories ###

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

### Process ###

#### Domain model - classes ####

1.

| Object: |App| | | |
|:------:|:------------:|:-:|:-:|:-:|
|**Attributes:**|menu|orders|total
-cost | |
|**Methods:**|show_menu|order_item|check_order|complete_order|

2.

| Object: |Order| | | |
|:------:|:------------:|:-:|:-:|:-:|
|**Attributes:**|Dish|Quantity|Cost | |
|**Methods:**|select_dishes|check_order|place_order|

3. 

Object: Confirmation

#### Designing tests ####

Once I had designed a first draft of my domain model, I planned the tests I would need to design, starting with the simplest:

* app prints a menu
* app allows a user to create an order with one dish
* app shows order
* total price = sum of order
* user can place order
* confirmation returns a confirmation message
* app allows user to order a dish with a quantity of more than one
* app allows user to order more than one dish
* confirmation message shows expected time (time now + 1hr)

**Possible edge cases:**

* show order should fail when no order placed
* user cannot select an item not on the menu
* confirmation can't be placed when order empty



## Credits ##

List any credits or inspiration here


