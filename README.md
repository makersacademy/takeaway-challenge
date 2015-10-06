[![Build Status](https://travis-ci.org/catherinestevenson/airport_challenge.svg?branch=master)](https://travis-ci.org/catherinestevenson/airport_challenge)

Takeaway Challenge
==================

Week two weekend challenge at Makers Academy. My task is to test drive the creation of a set of classes/modules to satisfy all the user stories below.

Task
-----
Write a Takeaway program with the following user stories:

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

## Technologies Used:

1. Ruby
2. Rspec
3. Github
4. Twilio

## Approach I used:

I started by breaking down each user story and outlining possible classes and methods. I then experimented using irb to see how I would like my classes/objects to interact with one another and what method names to call. Next, I took a RED -> GREEN -> REFACTOR approach and wrote each test first, watched it fail, made it pass and then refactored if needed.

## How the app works:

```ruby
→ irb
2.2.3 :001 > require './lib/customer.rb'
 => true
2.2.3 :002 > customer = Customer.new
 => #<Customer:0x007fa45d183798 @takeaway=#<Takeaway:0x007fa45d183770>, @order_basket={}, @order_total=0, @total_items=0>
2.2.3 :003 > customer.view_menu
 => {"pizza"=>10.0, "burrito"=>6.0, "burger"=>7.0, "chicken"=>5.0, "chips"=>2.0}
2.2.3 :004 > customer.select_item('burger', 2)
 => 2
2.2.3 :005 > customer.select_item('pizza', 2)
 => 4
2.2.3 :006 > customer.receipt
 => "2x burger - £14.0, 2x pizza - £20.00"
2.2.3 :007 > customer.total_cost
 => "£34.00"
2.2.3 :008 > customer.pay('£34.00')
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC6bc3bdc8a652039b67ded216da24ea1e/Messages/SM6ed29ab6ca8f4689a8c71bcd5d71542a>
2.2.3 :009 >
```

## Progress
App completed and all tests passing.

## New things I learnt/improved on:

  1. Ruby gems
  2. API's
  3. Single Responsibility Principle
  4. Dependency Injection/Inversion Principle
  5. Test Driven Development
  6. Object Orientated Programming
