# Takeaway Challenge
This program has been designed to create a takeaway ordering system for the public. The program uses the `ruby` language and enables two different stakeholders `Takeaway owner` and `public` to perform their respective feature requirements.

## Motivation
This program forms part of the Week2 weekend challenge at Makers. The challenge used the skills of `doubles` and `dependency injection` that were learnt over the previous week. These techniques enable the program writer to build tests that test in isolation, without testing for functionality of additional classes.

## User Stories implemented
#### Takeaway owner
1. Can create dishes through the dish class
2. Can add dishes to the menu using the .add method in the takeaway
3. Can define whether a dish is available

#### Public
1. Can see only available dishes using the .list method in the takeaway program
2. Can input which dishes would like to order, which will create a new order

#### Stories not implemented
1. Ability to see the order total
2. Ability to get a text reminder

## Installation
This program is available in `ruby`. It requires certain `gems` to install the project:
> gem install bundle
> bundle

## How to use?
The file can be run through `irb`. Run the following code in the project working directory:
> irb -r ./lib/takeaway.rb

New dishes can be added using 
> dish_name = Dish.new("dish_name", price_as_an_integer )

New takeaways can be added using
> restaurant_name = Takeaway.new
Dishes can be added to the restaurant menu using the `.add` function

A user can view the list of available items using the `.list` method

## Areas for review
Code structure - is it well encapsulated
Naming convention - how easy is it to understand the relevant variables
Domain modelling - is the modelling appropriate
Features - are the features suitable, especially the ordering mechanism
