Makers - Takeaway Challenge
 
User story 1
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
 
Create Menu class
Create initialize method, include a menu_dishes hash  with key as food item and value as price
Make @menu_dishes an attr_reader
Create list_menu method to return the list of dishes, with prices
 
 
—————————————————————————————————————————
 
User story 2
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
 
Create Order class
Create selected_dishes method, with the parameter (item_chosen)
Create ordered_items array and push all (item_chosen)
 
—————————————————————————————————————————
 
User story 3
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
 
Create @total variable in the initialize method, and assign it a value of 0
Within the selected_dishes method, add each item_chosen => value to the total accumulator, using +=
Within the price method, return @total 
 
—————————————————————————————————————————
 
User story 4
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
 
Sign up to Twillo, and rub gem install twilio-ruby
Instead of replacing the values for account_sid and auth_token with your unique values, I set up environment variables to keep credentials secret before deploying to production. I also added ENV variables for both mobile numbers
Navigate to .bashrc file in the home directory, and add you env variables, (using the export command): ‘echo key=>value ‘
You can create a .env file in the project folder - This must be added to the .gitignore file if used
By using .sid, you can later fetch this specific message.
Then create takeaway class, and add doubles for Menu, Order and SendMessage classes
Create a ‘takeaway’ process from start to finish: List menu, Order Dishes, Checkout and check price, Send order text message. Ensure to raise an error message if the total price is incorrect
Add 'twilio-ruby', '~> 5.23.0' gem to gemfile, then run bundle install, which will add the gem to gemfile.lock
Run gem install dotenv
In twillo_text file, require the following:
require 'twilio-ruby'
require 'dotenv/load' - For ENV variables
# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
 
Links used: https://www.twilio.com/docs/sms/quickstart/ruby, https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html
 
—————————————————————————————————————————
