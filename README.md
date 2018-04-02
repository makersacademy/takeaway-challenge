Takeaway Challenge
==================
# Takeaway Challenge (Makers Weekend Challenge #2)

A basic simulation of a takeaway ordering program, done for the Makers Academy course, weekend challenge #2

## Contents

##lib files
===========
takeaway.rb,
menu.rb,
basket.rb

##spec files
===========
takeaway_spec.rb,
menu_spec.rb,
basket_spec.rb

## Getting Started

**1)** Clone or download and unzip repository.  

**2)** Run bundle install to install dependencies listed in Gemfile.

**3)** The program requires a [Twilio](https://www.twilio.com/) account, with a twilio number, secure ID and authorisation token stored as environmental variables with the following names:

TWILIO_ACCOUNT_SSID: 'your SID here'
TWILIO_AUTH_TOKEN: 'your token here'
TWILIO_NUMBER: 'your number here'
TWILIO_DESTIN: 'destination number here'




## Instructions for use

The program has 3 objects:

**1) Takeaway:** this is the controlling object, which the user interacts with.

Takeaway understands the following method calls:
- **takeaway.view_menu** displays the menu in a readable format showing pizza's and prices.
- **takeaway.add_item(item,quantity)** add's the item by the required quantity. The quantity doesn't need to be entered, it is defaulted to 1. This method call will also perform a check on whether the item requested is in the menu. The user will get a message once the item(s) have been added.
- **takeaway.remove_item(item,quantity)** removes an item by the required quantity. Again, the quantity is defaulted to 1 if nothing is entered. This will also provide the user with a message once the item has been removed.
- **takeaway.view_basket** displays the current contents of the users basket along with subtotals for the individual items.
- **takeaway.total_bill** displays the total amount currently due for all items in the basket. (I would like to have changed this as the next method is reliant on this being called in order for the bill to be paid)
- **takeaway.checkout(amount_paid)** allows the user to enter the payment for the bill. This will generate a text message confirming the order and delivery time.

**2) Menu:** this is the object for storing the list of menu items and displaying them in a readable format.

Menu understands the following method calls, however the user does not need to use these method calls, they are all called from the Takeaway class:
- **menu.readable_menu** displays the menu in a readable format showing pizza's and prices, for example: "Pepperoni pizza : £7.50"
- **takeaway.item_on_menu?(item)** checks whether the item entered is on the menu - returns true or false.

**2) Basket:** this object is used for storing the ordered items and controlling what is added and removed. It also totals the items in the basket.  

Basket understands the following method calls, however the user does not need to use these method calls, they are all called from the Takeaway class:
- **basket.add_to_basket(item, quantity)** this adds the item by the quantity to the basket.
- **basket.remove_from_basket(item, quantity)** removes the item from the basket by the desired quantity. This will also raise error messages if the item selected is not in the basket or if the user tries to remove more than the quantity in their basket.
- **basket.display_order(menu)** this is used to display the order in a readable format. It will raise an error message if the basket is empty.
- **basket.order_total(menu)** this totals up the items in the basket and returns a combined total.

## Approach
I started by creating the takeaway class then introduced the menu class and basket class later on when refactoring. I struggled with the tests and implementing doubles after refactoring my code. It took a considerable amount of time to resolve these issues. I tried to introduce a seperate class for the text messaging but couldn't get this to run so placed the code in my takeaway class instead.

## Tech
ruby
rspec
Twilio
dotenv

## Positives
- Getting more used to TDD
- Feeling more comfortable using various classes
- Introduced the use of a text messaging facility through the twilio gem

## Things I'd improve
- I'd like to get the text messaging functionality in a class of it's own
- Refactor so that the checkout option wasn't dependent on the total_bill method being called before it.
- Reduce some of the repetition - adding, removing, etc
- Better use of doubles to improve test coverage.
