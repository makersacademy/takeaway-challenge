t = Takeaway.new      creates new takeaway, which
                      automatically spawns a new menu
                      complete with dishes to read

t.read_menu           shows hash of dishes & prices

t.order 'egg', 4     orders 4 eggs and puts in basket
                     with confirmation

t.basket_summary     shows '4x eggs = £2.65, 2x bread
                    = £1.05'

t.total               shows total order price '
                      Total: £5.00'

c.checkout            sends order and confirmation
                      text message via Twilio

----------


Classes

Takeaway - calls a new menu, completes/finalises order
Menu - sets menu and prices
Order - allows user to compile and send order

-----------


1.
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

- restaurant, menu, dishes, prices
- check menu & prices

2.
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

- order, dishes, shopping trolley / basket
- select, add to basket/trolley

3.
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

- order, total price
- add prices of items together, verify sum matches total

4.
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

- text message, order time
- send text message to user,
