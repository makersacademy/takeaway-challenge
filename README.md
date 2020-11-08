# Takeaway Challenge
Create a basic takeaway ordering system, containing a menu of items and prices, which allows the user to place an order and to receive text confirmation of that order.

## Motivation for Project
Weekend challenge for the end of week 2 of Makers Academy.

## Skills Practised
RSpec, incl mocking & doubles, linking to an API.

## How the code works
*insert sample run-through here*  
*will need to advise user to create their own Twilio account, and then to create a file called key.rb, with relevant parameters so that the Twilio key can be kept hidden from GitHub(i.e. by putting it in a file within .gitignore)*

## Challenge status
Initial review of user stories completed, notes made on types of objects to create.
Written code & tests for first user story re reading menu.
Written code within takeaway class to add ordered items to order, tested within RSpec. Moved order to Order class.

## Steps to finish challenge
*update last, showing what you would do next to complete challenge*
* consider limiting customer to ordering items from menu. Not explicitly requested, but seems logical to include.

## User Stories & task planning

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices

Need to return a menu when requested.  
Objects: customer, menu (list of dishes)  
Actions: read_menu  
Notes:
* create a list of dishes with prices - a hash sounds best

```
require './lib/takeaway'
takeaway = Takeaway.new
takeaway.read_menu # should return menu hash
```

> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes

Need to be able to place order for several dishes  
Objects: customer, order  
Actions: place_order  
Notes:
* customer to be able to order multiples of each dish
* confirmation sentence after each item
* store order in a hash, with name of menu item as key and number of menu items as value.  Then refer to dishes hash when calculating total

```
require './lib/takeaway'
takeaway = Takeaway.new
takeaway.place_order("pizza", 3) # should add 3 pizzas to an order
```

> As a customer  
> So that I can verify that my order is correct  
> I would like to check that the total I have been given matches the sum of the various dishes in my order

Need to check that total is correct  
Objects: customer, order, total  
Actions: total

```
require './lib/takeaway'
takeaway = Takeaway.new
takeaway.place_order("pizza", 3)
takeaway.place_order("burger")
takeaway.total == "Total: £24.96" # should return true
```

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

Need to receive a text advising that the order will be delivered before one hour from now. Need to link to current time! Need to utilise Twilio API (text message API).  
Objects: customer, order  
Actions: order_acknowledgement(via text)  
Notes:
* register for Twilio - done
* update Gemfile to include twilio-ruby gem - done
* use own mobile number - make this private & don't push to GitHub  
* also need to keep Twilio API key private - check how to do this on GitHub
* tests shouldn't send texts, so use mocking or stubs here
