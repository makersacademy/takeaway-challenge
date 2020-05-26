# Takeaway Challenge

This programme was created using TDD of the following user stories

### To install
* Fork this repo and clone to local repo
* Run the command `bundle` in the project directory to ensure you have all the gems
* Run `rspec` in top level of project directory to check test suite is working correctly.

----
## User Stories
----
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
##### To satisfy first user story TDD step implimentation:

* Menu Class:
  * menu_list: variable with restaurant name change menu_list to hashes with number values and prices
#show_list: method to show hash interpolation if entire menu list. Prints restaurant name and menu.
------
------
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
##### To satisfy second user story TDD step implimentation:

* Order Class:
  * #select_items : ask for customer order and quantity (defaults to 1)
  * #add_item: adds item to customer_basket array. Currently have to call everytime want to add somethng. Need to add loop for this. 
------
------
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
##### To satisfy third user story TDD step implimentation:

*Order Class / Basket Class
  * #customer_order_summary: list customer basket so far.
  * #subtotal: totals order so far.

------
------
##### To satisfy fourth user story TDD step implimentation:

* OrderProcess Class 
  - extract relevant methods into order process and create a start method.
* Send sms Class
  - link text message body with order summary and price

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
------
