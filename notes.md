# Takeaway challenge

At the end of week 2, this is the takeaway weekend challenge

## Hopes and fears

### My hopes for this challenge:
- That I will get to practice UML Domain modelling as I design what I want to build
- That I will get to practice using delegation to extract out classes - either at the beginning or while refactoring
- That I will get to practice using doubles and mocks - understanding better what it is that I am truly trying to test and mocking everything else
- That I will cover all of the brief and that my head will cope!
- That I will have time to write one or more feature tests

### My fears for this challenge:
- That I will be too tired by the weekend to really be able to think these things through
- That I will be too tired to see even the obvious
- That the task will take up too much of the weekend - I need some non-screen time this week!

## Getting started

`git clone https://github.com/samanthaixer/takeaway-challenge`

`bundle` to install the gems required. This should also install rspec for running the tests

## Usage

`irb -r XXX` to run from within `irb`


## Running tests

`rspec` to run all test files except the feature tests
`rspec spec/features/indian_takeaway.rb` to run just the feature test

Note: features tests use a double and mocks instead of sending the text message


***************

# The brief

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

# My approach
1. First capture the verbs and nouns
Customer
Menu (dishes) - view
Dish - select, available
Order - create_order, complete_order, count_items, matches_total?
Text_message - create, send, receive

2. Second draw some diagrams
This bit I have found hard. I still am not sure how I would design something just from drawing diagrams. Building the code through tests helps me formulate what I am trying to do.

3. Start building tests
- First I started building out the dish class. We can't have a menu or an order made up of dishes without a dish itself! Of course, this was built using TDD. I actually can't imagine not using TDD for my coding, it guides my design so much!

4. Somehow build out the functionality
- I mostly followed TDD for this but definitely found a couple of occurrences where I didn't spot the test until I had written some code.
- I built out user stories 1 - 3 before even attempting story 4 (to add the text message)
- I built out non-double tests first to check my functionality and then introduced doubles. When I removed the original tests, I checked that the double tests broke when I changed the code in the class that I was testing
- I used dependency injection and understood it to the level of injecting a double object

5. Look to send texts
- To implement the functionality seemed easier than I expected. I added twilio-ruby and dotenv to my gem file so that I could use environment variables. So far so good. But for some reason, I just can't get twilio to send to my mobile number. It returns an error saying that my mobile number isn't valid.
- Ignoring the error, I then built out further tests to mock the sending of the message so that other classes don't test the actual send. However, given that this isn't yet working, I haven't finished my dependency injection or the actual implementation.
- I noticed that I understood my dependencies and therefore the injection part much better when I used my sequence diagram.
- I remembered that I can mock a method rather than a whole class which helped me test most but not all of the send_text functionality without needing to actually attempt to connect
- I think there is potential to extract a connection class but I think it's beyond me today
