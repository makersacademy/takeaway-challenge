
# Takeaway Challenge

A takeaway app for IRB

Lets the user see a menu, order dishes, check their basket and check out. Will send a text message to confirm delivery time after order is completed.

This app was built by me as part of the Makers Academy bootcamp coursework. In doing so I practiced test driven development, encapsulation in classes and the use of gems for interaction with the outside world.

It uses the Twilio gem to send text messages.

## Set up
Run the following commands in terminal

`git clone https://github.com/heuperman/takeaway-challenge.git`

`cd takeaway-challenge`

`gem install bundler`

`bundle install`

This app relies on several local variables being set. To use it you will have to register for a (free) [Twilio](https://www.twilio.com/) account and verify your phone number. 

Open .bashrc in your favourite text editor and add the following lines:
`export TWILIO_ACCOUNT_SID='put your SID here'`
`export TWILIO_AUTH_TOKEN='put your auth token here'`
`export TWILIO_PHONE_NUMBER='put your Twilio number here'`
`export MY_PHONE_NUMBER='put your phone number here'`
Replacing 'put your... here' with the information found on [your Twilio console](https://www.twilio.com/console)


## Running the app
Once you are all set up run
`irb -r './lib/takeaway.rb'`

`takeaway = Takeaway.new`

The instance `takeaway` will accept the following commands:

`.show_menu`
Show a list of available dishes and their prices

`.order(dish, amount)`
Add a dish to your basket, with dish being the name of the dish in quotes and amount being the number you want to order.

`.show_basket`
Shows the current content of your basket.

`.checkout(amount)`
Confirm your order and check out, with amount being the combined price of all the dishes in your basket (just the numbers, no currency symbol needed).

# Testing

A full suite of tests is available in `./spec`, including a feature test name user_stories_spec.rb.

Type `rspec` in the main directory to run both the unit tests and the feature test. Be aware that this will trigger the text comfirmation feature and send a text.
