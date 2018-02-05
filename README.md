# Takeaway Challenge

Second weekend challenge at Makers Academy.

This program emulates a Thai takeaway. You can look at the menu, make orders, and confirm your order through SMS.

## How to use

Use Ruby Version 2.5.0

```
irb -r './lib/takeaway.rb'

```
### Sample output

```
Lauras-MBP:takeaway-challenge lwkchan$ irb -r './lib/takeaway.rb'
2.5.0 :001 > the_thai_guys = Takeaway.new
 => #<Takeaway:0x00007fa615a54480 @menu=#<Menu:0x00007fa615a54408 @options={:prawn_crackers=>1.95, :prawn_summer_roll=>4.95, :vegetable_spring_rolls=>3.95, :tom_yam_soup=>4.95, :green_curry=>6.95, :pad_thai=>6.95, :steamed_rice=>2.25}>, @order=#<Order:0x00007fa615a54340 @current={}, @total_cost=0>>
2.5.0 :002 > the_thai_guys.print_menu
            Today's specials            
         Prawn crackers: £1.95          
        Prawn summer roll: £4.95        
     Vegetable spring rolls: £3.95      
          Tom yam soup: £4.95           
           Green curry: £6.95           
            Pad thai: £6.95             
          Steamed rice: £2.25           
 => ["Prawn crackers: £1.95", "Prawn summer roll: £4.95", "Vegetable spring rolls: £3.95", "Tom yam soup: £4.95", "Green curry: £6.95", "Pad thai: £6.95", "Steamed rice: £2.25"]
2.5.0 :003 > the_thai_guys.take_order
What would you like to order? Press return when you are finished.
vegetable spring rolls
How many would you like?
3
What would you like to order? Press return when you are finished.
pad thai
How many would you like?
2
What would you like to order? Press return when you are finished.

 => nil
 ```

## Task

* Write a Takeaway program with the following user stories:

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

1. With the user stories, I sketched out my domain model as a sequence diagram. This was useful because the steps the user takes from looking at the menu, to making the order, to confirming the order happened in sequence.

2. Next, I moved through the user stories one by one to implement each stage. I did this with a test driven methodology: writing the tests first, failing the tests, then writing the code to pass the test.

3. Once satisfied with all my unit tests, I went on to test these as features in irb. For this, I used the user stories to double check the client would be satisfied.

5. Finally, I thought of possible edge cases which I should test against- the main one being if the user ordered something which was not on the menu.

# Key learnings
* Further understanding of TDD, including stubbing and doubles
* More confidence in using hashes to store information and manipulating them for results
* Implementing a web API (namely Twilio) to make my program go further than the console

# To complete
* Edge case for correcting the order
* Clarifying step-by-step in README
* Adding instructions for settting ENV variables to use Twilio
