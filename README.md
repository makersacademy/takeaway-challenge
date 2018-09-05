### Takeaway Challenge

This is a weekend challenge completed during Makers. It is a simple REPL app that allows me to select a number of items from a menu, make an order, and receive an SMS confirmation via the Twilio SMS API. 

#### Instructions:

Open up IRB with:

`
irb
`

Require the takeaway file with:

`
require './lib/takeaway.rb'
`

Initialize a new order with:

`
order = Takeaway.new
`

And you're good to go! Simply run any of the following methods on your order instance:

|method|description|
|------|-----------|
|#show_menu|see a list of items|
|#add_item(item)|adds the item argument to your order|
|#calculate_sum|calculate the sum of your order|
|#place_order|place the order and receive an SMS confirmation! (only supports my number for now)|

The text message feature is provided by the Twilio API.

All ingredients are responsibly sourced using trusted local farmers.
