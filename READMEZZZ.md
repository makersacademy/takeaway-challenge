# Takeaway Challenge!

## Understanding user story, domain modelling:

#### Verbs (Actions):
* place order
* select dishes
* check total
* send text

#### Nouns (things):
* customer
* order
  * list of dishes
  * total cost
* dishes
  * prices
  * quantity

Objects    |    Messages
------------------- | -------------------
order | add and remove dishes, call on totaller to calculate total
printer | print menu, print current order, print total
menu?? | hold prices and item info
totaller | takes order, sum of dishes
texter | takes order, sends text
script | prints menu, ask for order, prints total, activate texter etc


#### Creating a basic structure

Looking at the rough plan I have made above, I decided that the menu should use an instance variable that holds a hash of dishes and their corresponding prices.

The idea is that calling the key by the string name should be able to add it to an array in an instantiated instance of Order. This is quite an unrefined way of doing things, but I want to try to get the Twilio API integration working.
