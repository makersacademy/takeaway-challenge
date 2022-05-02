## Takeaway Weekdend Challenge

# How to install
Fork this repo, and clone to your local machine
Run the command gem install bundler (if you don't have bundler already)
When the installation completes, run bundle

# How to Run
Open IRB
Require all .rb files.

# How to test your code
Run RSpec from the takeaway-challenge directory.

# Introduction

This project is the weekend task following the second week at Makers Academy.
The project comprises the construction of a take away app, where customers can order food. The main
classes and associated methods in this project are:

    - Homepage : where customer can view different menus.
			- display_restaurants : lists available restaurants which have their menus saved as csv files.
			- see_restaurant_menu(restaurant_name) : displays the menu of a specific restaurant.
			- create_order(restaurant_name) : creates a new order that can only accept items from specific 
				restaurant.

		- Menu : contains information about dishes and prices, imported from csv file.
			- read_menu : converts csv file to hash and then returns formatted menu.
			- csv_to_hash : searches for csv file based on intialized class value and converts information in 
				file to hash.

		- Order : a food order that can be edited and viewed by the customer.
			- add(item) : adds available items on menu to order array, including price.
			- remove(item) : removes item from order if item is in order array.
			- view_order : displays a formatted version of the customers order.
			- order_toal : sums the price of the items ordered and returns a formatted toal cost.
			- confirm_order : [NOT COMPLETED] sends order to restaurant and sends confirmatory text with 
				expected delivery time.

		- Text : an SMS that can be sent to customers
			- confirmation_text : sends confirmation text of food order and expected delivery time.

# Motivation

The motivation behind this project is to continue to develop the ability to write a programme using a test  
driven approach. The general process when writing this code was to create feature and unit tests using IRB/ RSpec
and then write code that will satisfy the test, using error messages as guides. 
This exercise was also important to strengthen an understanding of how objects interact within a programme and
how to plan which classes and methods will be requried to satisfy the client brief.

# Brief

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


# Process

[miro board of initial plan](https://miro.com/app/board/uXjVO4xSzI8=/?share_link_id=204847719690)

# Key Thoughts and Issues

	• Need to write spec tests for Text - the concept of getting code to send an SMS was new to me, so I couldn't write a
		test for expected behaviour (because I didn't know what to expect). 
	• Need to write a test to make sure 'confirm_order' in Order class creates an instance of text.
	• Need to write test that 'confirmation_text' returns a specific text when accessed from order class.
	• Could write a Dish class, which contains information about the dish and can be altered to say if it is out of stock.
