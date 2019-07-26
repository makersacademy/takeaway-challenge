# Task

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
# Approach
I designed a domain model by extracting the objects and methods from the user stories. For example takeaway.create_order, takeaway.display_order, takeaway.add_order etc. This enabled me to move forward with a TDD approach, running feature tests in IRB to picture the behaviour of the program.

```takeaway = Takeaway.new
Traceback (most recent call last):
        2: from /Users/admin/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):1
NameError (uninitialized constant Takeaway)
```
From running a feature test I was able to move on to creating unit tests with RSpec. As above, the error displayed highlights NameError. From this I was driven to build a unit test to receive the same error, and from this I know to create a Class (class Takeaway) to resolve the error. This is also known as the Red-Green-Refactor cycle.

# Progress/Status of Project
I was unable to complete the full challenge due to some struggles I faced with the implementation of Twilio. I was able to successfully receive a text message to my phone, however, I was unable to make this work within my code and to make any sensitive information private before pushing to Github (hence the commented out send_sms spec and lib file with the information deleted).

I am satisfied that I have worked through the first three user stories and my feature tests highlight this. However I  struggled with reaching 100% coverage, around 70% for my takeaway.rb file. In an ideal world I would have been able to spend more time focused on improving these percentages, but towards the end of the third user story I started to get a little lost.

# Technologies
This project is built with Ruby, if/when completed this would include the use of the Twilio API.

# Problems
As I stated above my test coverage was not 100%. I will need to revisit topics on testing in isolation and further TDD concepts to improve coverage scores as I am still not very comfortable with my understanding of TDD. 

In addtion my unit tests were outputing repeated information when running RSpec, again if I had a greater amount of time I would have liked to source the issue I had here.

# Improvements
Due to the problem stated above, the readability of the output from RSpec was confusing and I would like to improve my understanding of RSpec and being able to identify where errors are occurring.

# Code Quality
I've used Rubocop to keep the code quality in-line with expected standards.

# Using this Code
Clone this repo to your local machine.
Run bundle install to install necessary gems.
Use IRB as described below to interact with the Takeaway.
Run IRB with the Ruby files required-in:
```
irb -r ./lib/order -r ./lib/takeaway
```

Create a new Takeaway object:
```
2.5.0 :001 > t = Takeaway.new
 => #<Takeaway:0x00007fd6c8857a18 @pizzas=[{:name=>:Original, :price=>8}, {:name=>:Pepperoni, :price=>10}, {:name=>:Veggie, :price=>9}, {:name=>:Hawaiian, :price=>10}, {:name=>:Ranch, :price=>12}, {:name=>:Garlic, :price=>8}]> 
 ```
Takeaways are currently created with a hard-coded menu as an array of hases.

Start a new order:
```
2.5.0 :002 > t.create_order
 => #<Order:0x00007fd6c8854520 @select_pizza=[], @total_price=0, @successful=false>
```
Display the menu:
```
2.5.0 :003 > t.menu
1: Original (£8)
2: Pepperoni (£10)
3: Veggie (£9)
4: Hawaiian (£10)
5: Ranch (£12)
6: Garlic (£8)
 => [{:name=>:Original, :price=>8}, {:name=>:Pepperoni, :price=>10}, {:name=>:Veggie, :price=>9}, {:name=>:Hawaiian, :price=>10}, {:name=>:Ranch, :price=>12}, {:name=>:Garlic, :price=>8}]
 ```
Add to the order by passing number of item as argument for add_order(): 
```
2.5.0 :004 > t.add_order(1)
Your total price is: £8

2.5.0 :005 > t.add_order(4)
Your total price is: £18

2.5.0 :006 > t.add_order(5)
Your total price is: £30
```

Repeat the above step until you've built your order. You can see how the order has been built:
```
2.5.0 :007 > t.order
 => #<Order:0x00007fd6c8854520 @select_pizza=[{:name=>:Original, :price=>8}, {:name=>:Hawaiian, :price=>10}, {:name=>:Ranch, :price=>12}], @total_price=30, @successful=false>
```
Use t.display_order to display the selected pizzas:
```
2.5.0 :008 > t.display_order
Pizza: Original Price: 8
Pizza: Hawaiian Price: 10
Pizza: Ranch Price: 12
Order Total = £30
```
Then we enter t.place_order, Once the order is complete. This will reset order and empty our select_pizza array.
```
2.5.0 :009 > t.place_order
Order successfully placed!
 => []
```
The final step above for t.place_order should enable a text to be sent to confirm the order has been placed. This links to the final user story that I have been unable to cover this weekend.
