# Takeaway Challenge
==================

Takewaway is a programme that allows customers to order dishes. I have implemented the first user story that allows customers to view a list of dishes and prices.

Please see below for my reflections on how I solved this problem.

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop) `Test coverage: 100%`

# How to use this programme

Use git clone to create a local repo. 
`git clone https://github.com/katemyoung/airport_challenge.git` 

Use bundler to install the required gems by running the command `bundle` in the project directory.

Navigate to the local repo then run irb.
`irb -r './lib/dishes.rb'`

Run `rspec` from the project directory to run the tests.

**You can:**
- Create a new menu by instatitaing a new instance of the Dishes class `menu = Dishes.new`, and passing it as an argument a hash of the form `{dish: 'Dish Name', price: price}` 
- View the menu by calling the list method `menu.list`
- Add to the menu using the add method `menu.add`

**irb sample:**
```

➜  takeaway-challenge git:(main) irb -r ./lib/dishes.rb
3.0.2 :001 > menu = Dishes.new({ dish: 'Pizza', price: 5 })
 => #<Dishes:0x00007fab579e7348 @dishes=[{:dish=>"Pizza", :price=>5}]> 
3.0.2 :002 > menu.list
Pizza: £5
 => [{:dish=>"Pizza", :price=>5}] 
3.0.2 :003 > menu.add({ dish: 'Pasta', price: 3 })
 => [{:dish=>"Pizza", :price=>5}, {:dish=>"Pasta", :price=>3}] 
3.0.2 :004 > menu.list
Pizza: £5
Pasta: £3
 => [{:dish=>"Pizza", :price=>5}, {:dish=>"Pasta", :price=>3}] 
3.0.2 :005 > 

```

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

## Domain model

![alt text](media/domain_model.png "Domain model for Takeaway Challenge")


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) when you run your tests.


# How I solved this challenge

*How to structure this section? What was most useful from last time?*

## My plan
- [ ] Parse user stories and extract verbs and nouns into UML class diagram domain model

## The reality


## Reflections

## Questions

**Drawing on feedback from my last project**
*Feedback summary here*
structure of my example groups

**How I plan to improve with this project**
- [ ] To run `rubocop` before every commit I make
- [ ] Aim for 100% test coverage
- [ ] If I go off track, to use git to restore a previous working version
- [ ] Structure my test example groups using `describe` blocks for behaviour and `context` blocks for state.
- [ ] Add a simplecov test coverage badge to this README

# Feedback from code review

See also the PR comments.