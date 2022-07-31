** Takeaway Challenge**

# Task

Makers Academy Takeaway challenge
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
# My Approach

I diagrammed and planned out the user stories and then my approach was to tackle each user story, writing tests and following Red, Green, Refactor for TDD to implement a basic version of the program before moving onto Seperation of concerns and refactoring to ensure I was following the single responsibility principle. In the time given I was only able to work on the first three user stories and get a basic working model without moving onto the last user story or implementing any encapsulation or refactoring. Given more time I would add the text function and then split out into different classes the different functions such as an Order class, a Text class etc.

# How it works

```
benfielding@Bens-Air takeaway-challenge % irb -r './lib/takeaway.rb'
3.0.2 :001 > chinese = Takeaway.new
 => #<Takeaway:0x0000000113244258 @menu={"Sweet & Sour Chicken Balls"=>6.3, "Salt & Pepper Chicken"=>6.3, "Chicken Fried Rice"=>6.8, "Prawn Crackers"=>2.8}, @order={}> 
3.0.2 :002 > chinese.view_menu
Sweet & Sour Chicken Balls: £6.3
Salt & Pepper Chicken: £6.3
Chicken Fried Rice: £6.8
Prawn Crackers: £2.8
 => {"Sweet & Sour Chicken Balls"=>6.3, "Salt & Pepper Chicken"=>6.3, "Chicken Fried Rice"=>6.8, "Prawn Crackers"=>2.8} 
3.0.2 :003 > chinese.place_order("Sweet & Sour Chicken Balls", "Chicken Fried Rice")
 => ["Sweet & Sour Chicken Balls", "Chicken Fried Rice"] 
3.0.2 :004 > chinese.order
 => {"Sweet & Sour Chicken Balls"=>6.3, "Chicken Fried Rice"=>6.8} 
3.0.2 :005 > chinese.view_order
The order total is £13.1
 => 13.1 
3.0.2 :006 > 
```
COVERAGE: 100.00% -- 27/27 lines in 2 files