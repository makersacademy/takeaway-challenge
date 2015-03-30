#Takeaway Challenge#

[![Build Status](https://travis-ci.org/RBGeomaticsRob/takeaway-challenge.svg)](https://travis-ci.org/RBGeomaticsRob/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/RBGeomaticsRob/takeaway-challenge/badge.svg)](https://coveralls.io/r/RBGeomaticsRob/takeaway-challenge)

##Task##

This is the end of the second week challenge at Makers Academy, it will be developed in a test driven approach with a focus on good OO design, including a focus on SOLID principles.

##User Stories##
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

##MVP Roadmap##
Extracted prototype road map to provide focus and clarity on development steps from the user stories.

- MVp1 - User can check menu, place an order for it, check the order totals before purchase, confirm order and recieve a text to say it is on-route.

- MVp2 - User can check menu, place an order for  *multiple quantities*, check the order totals before purchase, confirm order and recieve a text to say it is on-route.

- MVp3 - User can check menu of all items, place an order for *multiple items* at multiple quantities, check the order totals before purchase, confirm order and recieve a text to say it is on-route.

MVP reached.


##Domain Design##

This project is being developed in a BDD approach and therefore the domain design below will grow and

- Menu - Responsibile for holding the menu items
- Order - Responsibile for collating order
- Print - Responsible for displaying information on screen
- Customer - Responsibile for knowing customer information
- Shop - Responsible for processing orders.
- Sms - Responsible for Texting Confirmation to the purchaser
- Keys - Responsible for holding API keys/tokens (not sent to version control)

##Methods##

####Class: Menu####
Optionally accepts a hash on load to set menu file *{ menu: './menu.yml' }*, otherwise default menu provided.
- load!(*yaml_file*)
- item(*number*)
- items

####Class: Order####

- add!(*menu item, quantity*)
- total_items
- cost
- items

####Class: Shop####

- take_order!(*order, customer*)
- total_orders
- orders

####Class: Customer####
Requires a hash on load to set menu file *{ name: 'Rob', tel: +447777000000, pcode: 'AA1 2ZZ' }*.

- name
- tel
- postcode

##Contribution##

This is a challenge set to identify progress in Wk2 at Makers Academy, therefore is designed to be tackled individually.

However comment on the quality of the code would be very welcome.

