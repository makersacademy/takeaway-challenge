##What is this?
The takeaway challenge is a weekend challenge from the 2nd week of MakersAcademy: the focus of this week was again on implementing good OOP & TDD principles.

NB. For testing, this project uses RSpec 3 notation

##Getting Started

You will need a free Twilio account:
- [ ] Enter the AUTH_SID & AUTH_TOKEN in the takeaway-challenge/lib/restaurant.rb file
- [ ] Only enter phone numbers for customers that have been verified for your Twilio account (if using the free account)

To create a new restaurant (menu provided):
```ruby
  restaurant_name = Restaurant.new
```
To create a new customer account:
```ruby
  customer_name =  Customer.new( customer_name_string, phone_number_string)
```

To select a restaurant for the customer to view menu & order from:
```ruby
  customer_name.select_restaurant restaurant_name
```
Customer commands:
```ruby
  customer_name.
                request_menu
                create_order
                update_order food_item, quantity
                display_order
                submit_order
```

##User Stories:
The code snippets below assume that the user has created a restaurant & customer object, and that the customer has 'selected' that restaurant - as demonstrated above.

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```ruby
customer_name.request_menu
```

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
(In this case, let's assume the customer wants 3 orders of lasagne)
```ruby
customer_name.create_order
customer_name.update_order :lasagne, 3
```

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```ruby
customer_name.display_order
```

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

```ruby
customer_name.submit_order
```

##Remaining questions:
- How to make phone number secret using environment variables?
- How to mix-in the twilio-ruby gem functionality without breaking Dependency Inversion Principle?
