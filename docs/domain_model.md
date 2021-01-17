User Stories
--------------

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

Investigating the user stories.
Take the nouns and actions highlighted in the user stories and fill in the three tables below to help us uncover some more details about them and see how they relate to each other.

Nouns
-----
Menu  
Dish   
Dish description   
Dish price   
Text  
Text_generator  
Order  
Basket  
Total price

Actions
---------
Add dish to menu  
See a list of dishes and prices  
Add dish to basket  
Check total of dishes in basket  
Place order  
Send text  


**Class needed for dishes as we are adding to it within ruby (not using a CSV file)**


|Noun|Property or owner of property?|
|---------|------------|
Menu|Owner of property (dish)
Dish|Property of menu and owner of properties (description and price)  
Dish description|Property of dish
Dish price|Property of dish
Text|Property of text_generator  
Text_generator|Owner of text
Order|Owner of basket, total price
Basket|Property of order
Total price|Property of order


|Actions|Action owner|
|---------|------------|
Add dish to menu|Menu  
See a list of dishes and prices|Menu
Add dish to basket|Order  
Check total of dishes in basket|Order  
Place order|Order  
Send text|Text_generator


|Actions|Property it reads or changes|
|---------|------------|
Add dish to menu|Changes menu  
See a list of dishes and prices|Menu
Add dish to basket|Order  
Check total of dishes in basket|Order  
Place order|Order  
Send text|Text_generator

Class diagrams for these user stories:
Summarise what we have learned from the three tables in the previous section into class diagrams.

Class
Menu
Properties (instance variables)
Description, Price
Actions (methods)

Class
Restaurant
Properties (instance variables)
Basket, running total
Actions (methods)
See list of dishes and prices (menu)
Add items to basket
Check running total
Place order
