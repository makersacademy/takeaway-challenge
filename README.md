Airport Challenge
=================

Task
-----
This software is for an Indian Takeaway. The customer should be able to use this application to see the menu, order their food and see a summary of their order with prices and the total cost. They should then receive a message telling them when their food will arrive.

How to Install
-----
Clone this repository by typing 'git clone https://github.com/jenniferbacon01/takeaway-challenge' into your command line.
Then type 'bundle install' to install all the relevant gems.

How to Run
-----
Via the command line by typing 'ruby takeaway_app.rb' from the takeaway-challenge/lib directory.

How to Test
-----
Install the rspec gem by typing 'gem install rspec' into your command line.
Run tests by typing 'rspec' into your command line when you are in in the takeaway-challenge directory.
Tests are available to view in takeaway-challenge/spec directory.

Comments
-----
A few changes to the code must be made in order to run the app in the command line. These are all notes in the comments of the lib files:
-Commenting out the require_relative lines in order_item.rb and order.rb
-In order.rb you must use the commented out initialize method instead of the current one
-In takeaway_app.rb you must comment out the (order) parameter for the receive_order method and use the commented out @order assignment
