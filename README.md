[![Build Status](https://travis-ci.org/jbropho/takeaway-challenge.svg?branch=master)](https://travis-ci.org/jbropho/takeaway-challenge)
# Takeaway Challenge
## Makers Academy weekend challenge to create a takeaway app with text notifications.
[Challenge Specification](https://github.com/makersacademy/takeaway-challenge)

## Usage

1. Sign-up for a [Twilio Account](https://www.twilio.com/) and follow
the steps to set up a phone number to send/receive texts.

2. Project set-up
      ```
      git clone https://github.com/jbropho/takeaway-challenge
      cd takeaway-challenge
      bundle install
      ```


3. Set temporary environment variables
      ```
      export AC_SID=your_account_sid_here
      export TWIL_TOKEN=your_auth_token_here
      export MY_NUMBER=your_real_phone_number
      export TWILIO_NUMBER=your_twilio_phone_number
      ```

4. Run irb

     ```
     2.5.0 :001 > require './lib/order.rb'
     => true
     2.5.0 :002 > menu = Menu::curry_house
     => #<MealList:0x00007f9b539d5878 @meals=[#<Meal:0x00007f9b539d5738 @name=:bhuna, @price=6.99>, #<Meal:0x00007f9b539d5698 @name=:mkhani, @price=4.5>, #<Meal:0x00007f9b539d5620 @name=:bhaji, @price=1.1>]>
     2.5.0 :003 > PrettyPrinter.print_meals(menu)
     Dish : bhuna, Price : 6.99
     Dish : mkhani, Price : 4.5
     Dish : bhaji, Price : 1.1
     2.5.0 :004 > order = Order.new(:mkhani => 3, :bhuna => 2, :total => 5)
     => #<Order:0x00007f9b5399eb48 @order={:mkhani=>3, :bhuna=>2, :total=>5}>
     2.5.0 :005 > order.place_order
     ```


## Extra, order via text
5. Sign up for an account with [Heroku](https://heroku.com), install and login to the CLI

6. Inside project root directory

    heroku create
    heroku config:set AC_SID=your_account_sid_here
    heroku config:set TWIL_TOKEN=your_auth_token_here
    heroku config:set MY_NUMBER=your_real_phone_number
    heroku config:set TWILIO_NUMBER=your_twilio_phone_number
    heroku push master


7. Go to the manage numbers sections of your Twilio account dashboard,
click on your twilio number to edit. In the messaging section add the root url of your heroku app to the 'A message comes in' webhook and set the HTTP method to POST.

8. Send your order via text to your Twilio number

   ```
   {:dal_makhani => 3, :biryani => 2, :bhaji => 3, :total => 8}
   ```
