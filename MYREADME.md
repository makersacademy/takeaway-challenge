# Makers Weekend Challenge Week 2 - Takeaway Challenge

## How to use

To install all the relelvant gems:

`bundle install`

To use the program in irb:

`require './lib/takeaway'`

Create a new instance of the takeaway class:

`x = Takeaway.new`

View the list dishes to choose from on the menu:

`x.view_menu`

Add a dish to your order:

`x.add_to_order("Seaweed")`

Check which dishes are currently part of the order and their total cost:

`x.order`

`x.order_total`

Confirm the order by passing the correct order total. If the order total is incorrect, an error will be raised. If the total is correct, a text will be sent confirming your order

`x.confirm_order(4.50)`

## To be added
This program is currently quite bare bones and I would like to add to it in future. Features I would add include:
- Look into moving the order methods into a seperate class
- Better tests - currently no tests written for the textmessage class
- Output strings to let the user know that their items have been added to the order
- Raise an error if a user tries to order a dish that isn't on the menu
- Set the textmessage to include the time one hour from when the order was place
- Use environment variables to hide my Twilio details (will make this repo private until that is done)
