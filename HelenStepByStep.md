Makers - Takeaway Challenge<br>
 <br>
User story 1<br>
As a customer<br>
So that I can check if I want to order something<br>
I would like to see a list of dishes with prices<br>
 <br>
Create Menu class<br>
Create initialize method, include a menu_dishes hash  with key as food item and value as price<br>
Make @menu_dishes an attr_reader<br>
Create list_menu method to return the list of dishes, with prices<br>
<br><br>

User story 2<br>
As a customer<br>
So that I can order the meal I want<br>
I would like to be able to select some number of several available dishes<br>
 <br>
Create Order class<br>
Create selected_dishes method, with the parameter (item_chosen)<br>
Create ordered_items array and push all (item_chosen)<br>
<br><br>
User story 3<br>
As a customer<br>
So that I can verify that my order is correct<br>
I would like to check that the total I have been given matches the sum of the various dishes in my order<br>
 <br>
Create @total variable in the initialize method, and assign it a value of 0<br>
Within the selected_dishes method, add each item_chosen => value to the total accumulator, using +=<br>
Within the price method, return @total <br>
<br><br>
User story 4<br>
As a customer<br>
So that I am reassured that my order will be delivered on time<br>
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered<br>
 <br><br>
Sign up to Twillo, and rub gem install twilio-ruby<br>
Instead of replacing the values for account_sid and auth_token with your unique values, I set up environment variables to keep credentials secret before deploying to production. I also added ENV variables for both mobile numbers<br>
Navigate to .bashrc file in the home directory, and add you env variables, (using the export command): ‘echo key=>value‘<br>
You can create a .env file in the project folder - This must be added to the .gitignore file if used<br>
By using .sid, you can later fetch this specific message.<br>
Then create takeaway class, and add doubles for Menu, Order and SendMessage classes<br>
Create a ‘takeaway’ process from start to finish: List menu, Order Dishes, Checkout and check price, Send order text message. Ensure to raise an error message if the total price is incorrect<br>
Add 'twilio-ruby', '~> 5.23.0' gem to gemfile, then run bundle install, which will add the gem to gemfile.lock<br>
Run gem install dotenv<br>
In twillo_text file, require the following:<br>
require 'twilio-ruby'<br>
require 'dotenv/load' - For ENV variables<br>
Download the helper library from https://www.twilio.com/docs/ruby/install<br>
require 'rubygems'<br>
 <br><br>
Links used: https://www.twilio.com/docs/sms/quickstart/ruby, https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html