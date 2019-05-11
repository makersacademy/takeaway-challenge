Takeaway challenge

Order food quickly and simply online.

How it works:

1st user story

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

Website class created and delegates showing the food items and prices to the menu class.


2.5.0 :001 > require './lib/website.rb'
 => true
2.5.0 :002 > pizza = Website.new
 => #<Website:0x00007fbab081b998>
2.5.0 :003 > pizza.show_menu
 => {"Dough balls"=>4, "Bruschetta"=>6, "Olives"=>3, "Margherita"=>9, "Padana"=>13, "Giardinera"=>11}


2nd user story

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

Using the select method the user will type the desired item and the quantity.

2.5.0 :004 > pizza.select("Dough balls", 2)

3rd user story

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

Using the confirm_amount method the customer will input the total they expect to be paying.

2.5.0 :005 > pizza.confirm_amount(16)

4th user story

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
