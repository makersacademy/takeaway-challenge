# Takeaway Challenge

## About

An IRB application to order a takeaway. Created as the weekend challenge for week 2 of the Makers course.

Uses the Twilio API to send a confirmation text. You will need to sign up for your own trial account to use this.

Although this app is used through irb, it was built with the idea that it could be implemented with its own UI. Because of this some features are unintuitive. E.g. To add a dish to the basket you must pass the dish object. You can access these through the menu class.

## How to run

First set up a Twilio account here: https://www.twilio.com/.

Set your newly created auth details and test number as environment variables:

```shell
> export SID = '...'
> export AUTH_TOKEN = '...'
> export TWILIO_NUMBER = '...'
> export TEST_NUMBER '...' # Your own number, which you have verified with Twilio
```

Then run in IRB:

```shell
> irb -r './takeaway.rb'
> menu = Menu.new
> menu.print
> curry = menu.dishes[0]
> rice = menu.dishes[1] # Only required in IRB implementation
> basket = Basket.new
> basket.add(rice)
> basket.add(curry,2)
> basket.place_order
```