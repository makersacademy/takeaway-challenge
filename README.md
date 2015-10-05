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

## Approach I will use:

I will start by breaking down each user story and outlining possible classes and methods. I will then experiment using irb to see how I would like my classes/objects to interact with one another and what method names to call. Next, I will take a RED -> GREEN -> REFACTOR approach and write each test first, watch it fail, make it pass and then refactor if needed.

### Functionality I will implement:

  * A list of dishes with prices
  * A customer can place an order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality will be implemented using Twilio API.
  * The twilio-ruby gem will be used to access the API
  * A Gemfile will be used to manage gems
  * All classes/modules will be thoroughly tested and mocks and/or stubs will be used as necessary

### How the app will work:

```ruby
→ irb
2.2.3 :001 > require './lib/customer.rb'
 => true
2.2.3 :002 > c = Customer.new
 => #<Customer:0x007f894b02c570 @order_basket={}, @takeaway=#<Takeaway:0x007f894b02c520>>
2.2.3 :003 > c.view_menu
 => {"pizza"=>10.0, "burrito"=>6.0, "burger"=>7.0, "chicken"=>5.0, "chips"=>2.0}
2.2.3 :004 > c.select_item('burger', 1)
 => 1
2.2.3 :005 > c.select_item('sausage', 1)
RuntimeError: Sorry, that item is not on the menu.
2.2.3 :006 > c.order_basket
 => {"burger"=>1}
2.2.3 :007 > c.select_item('burrito', 1)
 => 1
2.2.3 :008 > c.order_basket
 => {"burger"=>1, "burrito"=>1}


```

## Progress




## New things I have learnt/improved on:

  1. Ruby gems
  2. API's
  3. Single Responsibility Principle
  4. Dependency Injection/Inversion Principle
  5. Test Driven Development
  6. Object Orientated Programming
