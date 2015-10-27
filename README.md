Takeaway
=================

Challenge
---------
This was the Weekend Challenge that followed my second week at Makers Academy. The challenge was to create a virtual Takeaway, where users could view a list of dishes and compile an order. Once the order was submitted the user would need to be sent a text message confirming it via the Twilio API.

These were the user stories:


```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total price I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

Approach
--------
I wanted to build an interface that would be easy to use within irb, and to make use of three concepts that we had focused upon during the week: the Single Responsibility Principle, encapsulation and dependency injection.

Dependencies are minimised; different foods can be included as arguments submitted for order, and communication with the Twilio REST API is handled in a separate Twilio module. The program works as follows:
* Users can view a menu and order dishes via an instance of the main Takeaway class.
* The `take_order` command is used to select dishes. The command's first argument should be the total cost of the dishes being added (visible in the `menu`). The subsequent arguments should be the desired dishes, entered as symbols, e.g. :burger or :onion_rings. If the estimated cost in the first argument is wrong, an error will be raised. This approach satisfies the third user story above.
* Users can call the `review_order` command to see the dishes they have selected, along with their quantities and the subtotal.
* The `remove_order` command will erase the current order.
* Once the user is happy with their order, the `submit_order` command will finalise it. Calling the command will send a text via Twilio confirming that delivery will be made in the next hour.

Setup
-----
1. Fork this repository and then clone it using `git clone <url>`
2. cd to the project's folder, run `gem install bundle` and then `bundle`
3. Run `gem install twilio-ruby`
4. Run the program in irb using the following commands:

```ruby
require './lib/takeaway'
my_takeaway = Takeaway.new # Creates an instance of the Takeaway class
my_takeaway.menu # Displays the takeaway's menu, with prices, sourced from ./menu-file.txt
my_takeaway.take_order(<total price>,*<dishes>) # Orders the selected dishes. An unlimited number of arguments can be submitted for <dishes>. The <total price> must equal the exact price sum of all the dishes specified or an error will be raised. Dish names must match those in the menu i.e. they must be symbols. Here is an example:
my_takeaway.take_order(9.00,:fried_chicken,:fries,:onion_rings)
my_takeaway.review_order # Displays the current order
my_takeaway.subtotal # Displays the total price of the currently-selected dishes
my_takeaway.remove_order # Erases the current order
my_takeaway.submit_order # Submits the current order and sends the user a text
```

Real food not included, I'm afraid. Sorry!
