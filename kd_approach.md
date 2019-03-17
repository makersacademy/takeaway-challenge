## Project Overview
## Processes & Approach

#### CLIENT REQUIREMENTS

The aim of this project is to build a takeaway program to meet the user requirements. The program enables the user to view a list of dishes with prices and select some dishes they want to order. There is built-in verification within the program to check that the total cost/bill of the order matches what is expected given what the user has ordered. 

The user will confirm that they want to place the order. Once the order is placed, the user will receive a text message that their order will be delivered before the (order time (+ 1hr)).


#### USER STORIES

```
[X] As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

[X] As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

[X] As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

[X] As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

PROGRAM USAGE

- For the first iteration of the product, this software will be usable in Interactive Ruby via the terminal using `irb` and once the order is placed, the order confirmation text message will be sent to a UK-based verified mobile number. 

#### STEP 1 - SKETCHING OUT THE DOMAIN MODEL

I translated the user stories into a domain model.

#### STEP 2 - SET OUT THE OBJECTS / CHARACTERISTICS / INTERACTIONS

From the user stories, I set out the objects I will model and their interactions (messages).

#### STEP 3 - DEFINE METHODS AND WHAT THEY DO

Now that I set out my domain model, objects and their interactions (messages), next, I set out the methods.

#### STEP 4 - DEFINE TEST CASES

Now that I set out my domain model, objects and their interactions (messages), next, I set out the test cases.

#### STEP 5 - TDD PROCCESS

With my notes, I will go through the TDD process.

- USER STORY
- FEATURE TEST
- UNIT TEST
- CODE IMPLEMENTATION
- FEATURE TEST

##### CLASSES/OBJECTS

- Takeaway
- FoodMenu
- OrderManagement
- Messaging Service (via Twilio API)
- Twilio API - Authentication (account_sid, auth_token)


##### OBJECT CHARACTERISTCS

##### Takeaway

#### DOMAIN MODEL: MESSAGES/INTERACTIONS

Here is a screenshot of my domain model.


#### STORIES

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

```

##### OBJECTS

- Takeaway
- FoodMenu

##### MESSAGES

- User uses `irb` to interface with the Takeaway
- A takeway will have a `see_dishes` method to view the dishes
- The dishes will be held by `FoodMenu` object


- Multiple takeaways can be created, with different `FoodMenu`s
- A takeaway can be associated with a `FoodMenu` on creation e.g. Chinese Takeaway will have chinese food.

##### TEST CASE(S)

Takeaway:

1. [X] Takeaway object has `see_dishes` method
2. [X] Takeaway object`see_dishes` method outputs a dish
3. [X] Check `see_dishes` method outputs multiple dishes (possibly using `FoodMenu` object where dishes will be stored as sometimes the `FoodMenu` can change depending on which takeaway it is)

FoodMenu:

1. [X] Check that the `FoodMenu` holds some yummy dishes
2. [X] Check `FoodMenu` shows the list of yummy dishes

Interaction:

1. [X] Check that Takeaway object `see_dishes` method calls `FoodMenu` to show list of yummy dishes


```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

```

##### OBJECTS

- Takeaway
- FoodMenu
- OrderManagement

##### MESSAGES

- Customer can place order by interfacing with the takeaway
- Customer calls the method `place_the_order` at the Takeaway
- The Takeaway goes through the customer's `selected_dishes` list and then sends the name of the dish and the number of that dish to the `add_to_order` method which is the job of the `OrderManagement` object
- `add_to_order` adds each order into the OrderManagement

Validation:

- [X] There is some sort of validation within `OrderManagement` to verify that the dish is on the `FoodMenu`
- `we_serve?` checks that the dish is on the `FoodMenu`


##### TEST CASE(S)

Takeaway:

1. [X] Takeaway object has `place_the_order` method
2. [X] `place_the_order` method takes one parameter for the customer's selected dishes

FoodMenu:

1. [X] has the `we_serve?(dish)` method to verify that the dish is on the FoodMenu

OrderManagement:

1. [X] has the `add_to_order` method to collect and store the orders against selected_dishes
2. [X] `add_to_order` raises an error if the dish is not served by the Takeaway



```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

```

##### OBJECTS

- Takeaway
- FoodMenu
- OrderManagement

##### MESSAGES

- There is built-in verification within the program to check that the total cost/bill of the order matches what is expected given what the user has ordered.

- The OrderManagement calculates a total of the `selected_dishes`
- The OrderManagement `sum_total` method calculates the total cost of the ordered food
- Takeaway `place_the_order` receives this total to present to the customer


##### TEST CASE(S)

OrderManagement:
1. [X] has a `sum_total` method to calculate the cost of the food ordered


```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

##### OBJECTS

- Takeaway
- Message (Messaging Service (via Twilio API))
- Twilio API - Authentication (account_sid, auth_token)

##### MESSAGES
- Customer `place_the_order` at the takeaway and receives a text message "Thank you! Your order was placed and will be delivered before [CurrentTime + 1hr]"


##### TEST CASE(S)

- I haven't implemented the test for this yet.

- [] `place_the_order` sends message to `Message` object
- [] Message asks user for mobile number to send the message to
- [] Message deliver is successful

**To improve my project, next time I would like to:**

- Get test coverage from 99.14% to 100%
- I haven't tested the Twilio API implementation for sending the text message to the customer. Next time, I would like to learn how to implement RSpec tests for APIs
- I would like to learn how to stub out the behaviour of the Twilio API in my RSpec tests. At the moment, when I run my tests, the Twilio API sends a text message to the customer

- For an improved user experience, I would like to create an interface for usability, asking the customer questions such as: 
> 'Would you like to view the food menu?'
> 'What would you like to order'?
and then giving them a response.

For version 1, my project is functional in technical implementation, but is not responsive to user input. I would also like to improve the way the dishes are stored and presented. 

- At the moment, the messaging is hard-coded to my mobile number. This is an area to improve by asking the user to provide a mobile number and for that mobile number to work with the Twilio service!

##### TEST CASE(S) - EDGE CASES


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.



