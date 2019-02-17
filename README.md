Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Task
-----
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

## Approach
Firstly, I built the domain model by pulling out the objects and methods from the user stories above (Order, Order.place, etc). Once I had this diagram, I used the TDD approach with IRB to run feature test on how I wnated the program to behave:
```
ta = Takeaway.new
Traceback (most recent call last):
        2: from /Users/admin/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):1
NameError (uninitialized constant Takeaway)
```
Chasing errors like the above, I created RSpec tests to reproduce the above NameError. Once RSpec gave me the same error above, I created the class to satisfy it, as per the Red-Green-Refactor cycle of TDD.

I wanted this program to have an interactive feel to it, which I think prevented me from reaching 100% test coverage, so, given more time, I would like to learn more about testing with ```gets.chomp```, else find another method to achieve the same result of interactivity.

## Technologies
This project is built with Ruby, using the Twilio API.

## Problems
As mentioned above, my test coverage is not at 100% where I'd like to have it. 93.23% is below the recommended 95% for this project. I'm still learning to test in isolation, and given more time/expertise, I would raise this percentage even higher.

## Improvements
Originally, I wanted this to have an interactive feel, and earlier versions did, but this led to problems with RSpec unit tests and coverage, so I opted for a less interactive version to keep testing happy. In the future, I'd like to put this feature back in.

## Using this Code
- Clone this repo to your local machine.
- Run ```bundle install``` to install necessary gems
- Use IRB as described below to interact with the Takeaway

Run IRB with the Ruby files required-in:
```
irb -r ./lib/sms -r ./lib/order -r ./lib/takeaway
```
Create a new Takeaway object:
```
2.5.0 :001 > t = Takeaway.new
 => #<Takeaway:0x00007ff8fcbd27c8 @dishes=[{:name=>:rice, :price=>3.0}, {:name=>:noodles, :price=>3.5}, {:name=>:prawn_crackers, :price=>1.0}, {:name=>:spring_rolls, :price=>2.5}]> 
 ```
 Takeaways are currently created with a hard-coded menu as an array of hases.

 Start a new order:
 ```
 2.5.0 :002 > t.new_order
 => #<Order:0x00007ff8fcab1d58 @dishes=[], @total=0, @complete=false> 
2.5.0 :003 > 
```
Browse the menu:
```
2.5.0 :003 > t.menu
1: rice (£3.0)
2: noodles (£3.5)
3: prawn_crackers (£1.0)
4: spring_rolls (£2.5)
 => [{:name=>:rice, :price=>3.0}, {:name=>:noodles, :price=>3.5}, {:name=>:prawn_crackers, :price=>1.0}, {:name=>:spring_rolls, :price=>2.5}] 
2.5.0 :004 > 
```
Call ```t.add_to_order(x)``` where ```x``` corresponds to the item you wish to add to your order:

```
2.5.0 :004 > t.add_to_order(2)
noodles has been added to your order.
Your order is currently at £3.5.
```
This adds the selected dish to the ```t.order``` object. Repeat the above step until you've built your order.

Use ```t.show_order``` to display your currently-selected dishes:
```
Here are the items in your order:
noodles (£3.5)
 => [{:name=>:noodles, :price=>3.5}]
 ```

 When you're happy with your order, use ```t.place_order``` to send it to the kitchin. You will receive an SMS confirmation, too!

 ```
 2.5.0 :006 > t.place_order
Thank you! Your order was placed and will be delivered before 16:23
```