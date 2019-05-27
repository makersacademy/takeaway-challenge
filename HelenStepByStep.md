Makers - Takeaway Challenge
 
User story 1
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
 
 
Unit Test
Test to check Menu Class responds to list_menu method:
 it 'Show menu' do
   menu = Menu.new
   expect(menu).to respond_to(:list_menu)
 end
Test to see list of dishes:
 it 'Show menu' do
   menu = Menu.new
   expect(menu.list_menu).to eq({ :pizza => 4.00, :sausage => 2.00, :curry => 6.50, :rice => 2.00, :chilli => 6.00, :salad => 3.50,  })
 end
 
Create Menu class
Create initialize method, include a menu_dishes hash  with key as food item and value as price
Make @menu_dishes an attr_reader
Create list_menu method to return the list of dishes, with prices
 
 
—————————————————————————————————————————
 
User story 2
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
 
 
Unit Test
 it 'Select dishes and add to selected_dishes array' do
   order = Order.new
   order.select_dishes(:pizza)
   order.select_dishes(:sausage)
   expect(order.ordered_items).to eq([:pizza, :sausage])
 end
 
 
Create Order class
Create selected_dishes method, with the parameter (item_chosen)
Create ordered_items array and push all (item_chosen)
 
—————————————————————————————————————————
 
User story 3
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
 
 
Unit Test
 it 'Check total for order' do
   order = Order.new
   order.select_dishes(:pizza)
   order.select_dishes(:sausage)
   expect(order.total).to eq(6)
 end
 
Create @total variable in the initialize method, and assign it a value of 0
Within the selected_dishes method, add each item_chosen => value to the total accumulator, using +=
Within the price method, return @total 
 
—————————————————————————————————————————
 
User story 4
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
 
 
Unit Test
 it 'Confirm order is complete' do
   order.select_dishes(:pizza, 1)
   order.select_dishes(:sausage, 1)
   expect(order.place_order).to eq("Thank you! Your order was placed and will be delivered before 18:52")
 end
 it 'Order is incomplete' do
   expect{order.place_order}.to raise_error("Order incomplete")
 end
 
 
Sign up to Twillo, and rub gem install twilio-ruby
Instead of replacing the values for account_sid and auth_token with your unique values, I set up environment variables to keep credentials secret before deploying to production. I also added ENV variables for both mobile numbers
Navigate to .bashrc file in the home directory, and add you env variables, (using the export command): ‘echo key=>value ‘
You can create a .env file in the project folder - This must be added to the .gitignore file if used
By using .sid, you can later fetch this specific message.
Then create takeaway class, and add doubles for Menu, Order and SendMessage classes
Create a ‘takeaway’ process from start to finish: List menu, Order Dishes, Checkout and check price, Send order text message. Ensure to raise an error message if the total price is incorrect
 
Links used: https://www.twilio.com/docs/sms/quickstart/ruby, https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html
 
—————————————————————————————————————————
