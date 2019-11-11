Takeaway Challenge
==================

During my time at Makers, for on of our weekend challenges we were set the task of creating a takeaway application. The user stories were as follows-

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

I built the project over a weekend - using what I'd learnt over my first few weeks of Makers. The project shows a solid and continuous use of TDD as well as one of my first ventures into using the command line in order to build applications

### Screenshots

<img src="images/takeaway_code.png?" width="400px">

How potential data would be handled

<img src="images/twilio_code.png?" width="400px">

How the twilio Ruby Gem is used

<img src="images/tests.png?" width="400px">

Tests relating to user inputs

<img src="images/tests_2.png?" width="400px">

Tests relating to the Menu Class

<img src="images/passing_tests.png?" width="400px">

Passing Tests

Technologies Used
-----

* Ruby
  * I built my application with Ruby - using the command line to allow users to interact with the takeaway service
* Rspec
  * My testing framework was rspec - my final test suite had 17/17 passing tests and 94% coverage - the great majority of missing coverage was due to an inability to test the Twilio Ruby Gem

A Sample of the IRB
-----

```
2.5.0 :001 > require './lib/takeaway.rb'
2.5.0 :002 > takeaway = Takeaway.new

2.5.0 :003 > takeaway.list_of_options
Please enter 'display_menu' to see the menu
Please enter 'choose(meal, quantity)' in order to order a meal
Please enter 'show_basket' to see your current basket
Please enter 'show_total' to see your total
Please enter 'checkout' to place your order

2.5.0 :004 > takeaway.display_menu
1. Daniels's Delicious Chicken £12
2. Eduard's Enviable Eggs £19
3. Mark's Marvellous Lasagne £8
4. Gabriel's Godly Fries £25
5. Maria's Majestic Meatballs £24
6. Rafaela's Round Halloumi £39
7. Sayem's Saucy Fishcakes £22
8. Valeria's Value Milkshake £16

2.5.0 :005 > takeaway.choose(2,3)
 => [{"Eduard's Enviable Eggs"=>3}] 

2.5.0 :006 > takeaway.choose(5,4)
 => [{"Eduard's Enviable Eggs"=>3}, {"Maria's Majestic Meatballs"=>4}] 

2.5.0 :007 > takeaway.show_basket
Eduard's Enviable Eggs, Quantity: 3
Maria's Majestic Meatballs, Quantity: 4

2.5.0 :008 > takeaway.show_total
Your total is £153

2.5.0 :009 > takeaway.checkout(+7725776655)
```

Installation
-----

* Git clone the project into your own local repository
* Run bundle install in order to download the relevant gems
* Run irb in your local repo in order to start the application
* Add the following in the first line of IRB
```
2.5.0 :001 > require './lib/takeaway.rb'
```

Tests
-----

After bundle install has been run you will be able to run rspec to test the application. Just run rspec in your terminal to do so.