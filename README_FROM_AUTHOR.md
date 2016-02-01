INSTRUCTIONS:

Fork this repo, and clone to your local machine
	git clone <url>
Run the command: gem install bundle
When the installation completes, run: bundle
In the Gemfile, ensure ruby version is 2.2.3 in order to run RSpec tests (from project root directory)
Ensure you open irb, or pry from the project directory.

ABOUT:		

This is a project/challenge set by the coding bootcamp Makers Academy and then completed by the AUTHOR as a learning assignment.

Consequently, all scripts not included in the 'lib' or 'spec' directory are the work of the staff at Makers Academy.
This README therefore only relates to these two directories.

The challenge is to build a simple takeaway ordering program with a messaging system to update the customer on their order's progress.

MY APPROACH:

I approached my design with the intention of making it very easy to adapt. I separated out classes based, in part, on the areas that would be most likely to be enhanced in the future:

The inclusion of different menus. Ie, breakfast vs dinner menus or different cuisines with example class of Italian Menu.

The separation of processing from the user's takeaway interface.

The separation of text-order processing from ordering with select.

The development of Customer Relationship Management functions, such as including different ways to message customers and store information about the customer.

THINGS I NEED TO DO

1. Get Dotenv to work!
2. Write an ability to review and amend order before confirming it.
3. Feature test specs


USER STORIES:

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


USAGE GUIDE:
<!--
irb

2.2.3 :001 > require './lib/take_away_ui.rb'
 => true
2.2.3 :002 > takeaway = TakeAway.new
 => #<TakeAway:0x007fcd30b43de0 @cuisine_choice=ItalianMenu, @basket=Basket, @order=Order, @selection=[], @price=0>
2.2.3 :003 > takeaway.menu_choice(:lunch, :all)
 => {:Starters=>"Price", :Soup=>5, :Frutti_de_mer=>9, :Proscuitto=>7, :Capocollo=>9, :Mains=>"Price", :Focaccia=>10, :Calzone=>10, :Penne=>11, :Margherita=>13, :Lasagne=>13, :Desserts=>"Price", :Pannacotta=>7, :Semi_fresso=>7, :Tiramisu=>10}
2.2.3 :004 > takeaway.display
Starters                                                                   Price
Calamari                                                                       8
Olives                                                                         4
Panzerottini                                                                   7
Bruschetta                                                                     6
Gamberi                                                                        9
Insalata                                                                       7
Mains                                                                      Price
Margherita                                                                    13
Pasta                                                                         12
Risotto                                                                       11
Calzone                                                                       10
Carbonara                                                                     12
Bolognese                                                                     12
Gnocchi                                                                       11
Desserts                                                                   Price
Tiramisu                                                                      10
Gelato                                                                         8
Frutti                                                                         9
Tortoni                                                                        9
 => {:Starters=>"Price", :Calamari=>8, :Olives=>4, :Panzerottini=>7, :Bruschetta=>6, :Gamberi=>9, :Insalata=>7, :Mains=>"Price", :Margherita=>13, :Pasta=>12, :Risotto=>11, :Calzone=>10, :Carbonara=>12, :Bolognese=>12, :Gnocchi=>11, :Desserts=>"Price", :Tiramisu=>10, :Gelato=>8, :Frutti=>9, :Tortoni=>9}
2.2.3 :005 > takeaway.take_order
"What would you like to eat? Eg '2 Carbonara and a Tiramisu'"
2 calamari 3 gnocchi and a tiramisu
 => #<Basket:0x007fcd30b12f10 @selection=[[:Calamari, 2], [:Gnocchi, 3], [:Tiramisu, 1]], @menu_choice={:Starters=>"Price", :Calamari=>8, :Olives=>4, :Panzerottini=>7, :Bruschetta=>6, :Gamberi=>9, :Insalata=>7, :Mains=>"Price", :Margherita=>13, :Pasta=>12, :Risotto=>11, :Calzone=>10, :Carbonara=>12, :Bolognese=>12, :Gnocchi=>11, :Desserts=>"Price", :Tiramisu=>10, :Gelato=>8, :Frutti=>9, :Tortoni=>9}>
2.2.3 :006 > takeaway.review_order
Dish: Calamari                          Quantity: 2            Price per dish: 8                               Total: 16
Dish: Gnocchi                           Quantity: 3           Price per dish: 11                               Total: 33
Dish: Tiramisu                          Quantity: 1           Price per dish: 10                               Total: 10
            GRAND TOTAL: 59             
 => nil
2.2.3 :007 > takeaway.confirm_order(59)
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC311eb9c4bc2c0171b0fa8dbe12bc7e28/Messages/SM6a201068009c4c58828194bd9515c650>
2.2.3 :008 >  -->

CLASSES:

TakeAway

Acts as the user interface.

	Methods:



	Private Methods:

	Att_reader:
	holding_bay
	capacity
	sunny



LICENSE:	This project is licensed under the terms of the MIT license.
		see LICENSE.md

AUTHORS: 	Viola Crellin
CONTACT: 	viola.crellin@gmail.com

PROJECT CONTENTS:

      Gemfile
			Gemfile.lock
			Rakefile
			README.md - a description of the challenge set by MakersAcademy
			lib directory
				basket.rb
				italian_menu.rb
				order.rb
				message.rb
			spec directory
				basket_spec.rb
				checkout_spec.rb
				take_away_ui_spec.rb
				italian_food_spec.rb
				message_spec.rb
				feature_spec directory
					take_away_feature_spec.rb
