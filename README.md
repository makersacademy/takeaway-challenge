Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  B.F. |   ))))
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

My task was to write a takeaway program that would give a user the ability to see the contents of the menu (dish name and price), add any of those dishes to a basket and submit the basket for ordering. Once successfully ordered, a text message would be sent to the user (read: me) that the order has been received. As with all Makers work, the programme is test driven so, you now, that took a load of time to mock/stub properly.

I also took the decision to build a dish object that would then be added to the menu first. Seemed the simplest solution and would follow the same style/format that the rest of the programme would be rather than adding completely different functionality such as CSV manipulation or hard coding the menu (yuck).


User stories
-----

I added the acceptance criteria myself to help guide me, I also added the penultimate user story myself to help with my sanity - the challenge as written didn't actually say that orders needed to be submitted, just that a text should be sent when an order is submitted...

```
AS A customer
SO THAT I can check if I want to order something
I WOULD LIKE to see a list of dishes with prices

AC1 - Can print a list of all dishes (menu)
AC2 - Each dish includes a name
AC3 - Each dish includes a price

AS A customer
SO THAT I can order the meal I want
I WOULD LIKE to be able to select some number of several available dishes

AC1 - Can order one quantity of one dish from the menu
AC2 - Can order more than one quantity of one dish from the menu
AC3 - Can order multiple dishes

AS A customer
SO THAT I can verify that my order is correct
I WOULD LIKE to check that the total I have been given matches the sum of the various dishes in my order

AC1 - Can print each dish in the basket with the correct price
AC2 - Can print each dish in the basket with the correct quantity ordered
AC3 - Can print a total for the basket

AS A customer
SO THAT I can eat
I WOULD LIKE to submit an order for delivery

AC1 - Can submit an order
AC2 - Receives confirmation that an order has been submitted successfully

AS A customer
SO THAT I am reassured that my order will be delivered on time
I WOULD LIKE to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

AC1 - After an order has been submitted, a text is sent
AC2 - The text contains the above copy with an appropriate time (plus 1 hour from submit)

```

Planning process and other notes
-----

[To aid my development, I diagrammed the functionality fully. Please look at it, it took me ages](https://drive.google.com/file/d/1gkUxRdvpOBrwUFZViwY37CZTSYYlVmuY/view?usp=sharing) and I kept it up to date as I went along. I missed a few private functions, minor stats here and there and I changed the colour coding but otherwise not much changed from original draft.

The SubmitOrder class has a safe-mode (not used by default) which can be set through initialize. Safe-mode is turned on for the tests.

Installation and set-up
-----

1. Clone the repo:
```
git clone git@github.com:benfurber/airport_challenge.git
```
2. Open the directory:
```
cd airport_challenge
```
3. Install/switch to Ruby 2.5.0:
```
rvm install 2.50
rvm use 'ruby-2.5.0'
```
4. Install bundle (if required) and run it:
```
gem install bundle
bundle
```
5. [Sign-up to Twilio](https://www.twilio.com/), create a .ENV in the route and add the below:
```
TWILIO_ID = 'FROM_TWILIO'
TWILIO_TOKEN = 'FROM_TWILIO'
MY_PHONE_NUMBER = '+440000000000'
TWILIO_PHONE_NUMBER = 'FROM_TWILIO'
```

6. Check that the tests are still running and valid:
```
rspec
```

7. [Review the demo in the demo folder](https://github.com/benfurber/takeaway-challenge/tree/master/demo):
```
require_relative '../lib/menu.rb'
require_relative '../lib/order.rb'
require_relative '../lib/submit_order.rb'

# Create the objects
menu = Menu.new
order = Order.new
submit_order = SubmitOrder.new(SendMessage, true)

# Add the dishes
number_of_dishes = 5
dish_names = ['Dish one', 'Dish two', 'Dish three', 'Dish four', 'Dish five']
dish_prices = [4, 5, 6, 10, 6]
number_of_dishes.times { |i| menu.add_dish(dish_names[i], dish_prices[i]) }

# Print the menu to the console
puts '--------------------'
puts 'The menu:'
puts '--------------------'
puts
puts menu.print_dishes
puts

# Add two dishes to the order
order.add_to_basket(menu.dishes[0], 1)
order.add_to_basket(menu.dishes[1], 2)

# Print the order to the console
puts 'The order:'
puts '--------------------'
puts order.print_order
puts

# Submit the order
puts 'Submitted?'
puts '--------------------'
puts submit_order.submit(order.basket)
puts
```
