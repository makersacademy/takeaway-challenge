# Takeaway Challenge - Week 2 Makers
This is the weekend challenge for the Makers Academy for week 2. It models a basic takeaway system that the 'customer' can interract with via the command line. It uses the Twilio API to send a text to the number stored in the environment. You can see a menu, add items to your order, check your order and its total and place the order. Placing the order will send a message confirming it is placed and when you can expect to receive deliver (1hr from placement).

## To intall and use
- git clone "https://github.com/t-kellett/takeaway-challenge"
- run `bundle install` (assuming you have bundler installed, and a recent version of Ruby - this is build in RUby 3.0.2)
- run `irb` and the following commands:
```
require './lib/takeaway'
require './lib/dish'
require './lib/menu'
require './lib/order'
#initialises a few dishes to be added to the menu
beef = Dish.new('beef', 6)
rice = Dish.new('rice', 3)
noodles = Dish.new('noodles', 4.50)
#creates the menu with the dishes you just created
menu = Menu.new([noodles, beef, rice])
takeaway = Takeaway.new(menu)
#begins the interaction
takeaway.serve_customer 
```
- You will need to sign up for a Twilio account, and store the following env variables ['MY_MOB_NUM', 'TWILIO_NUM', 'TWILIO_ACCT_SID', 'TWILIO_AUTH_TOKEN'] - the latter 3 are the number you need to generate when signed up to Twilio in order to send messages, and the ACC_SID and AUTH_TOKEN are generated on creation of an Twilio account.

### Improvements to be made
This was built in Ruby, with the testing in rspec. Test coverage is currently low, at 75%. I have brute force tested this myself but ran out of time during building to properly write all the unit tests (my knowledge is at a point where the syntax of the unit tests took me far longer than writing the code, which I know works)

