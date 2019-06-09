# Takeaway Challenge

The aim of this challenge is to create a takeaway app that will text the customer once they place an order.

Full instructions can be found in old_readme.md

## Approach

We were given four user stories to guide us on functionality:

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

I grouped these user stories into 3 'versions' based on their core functions. Each version would advance what the app could do but allowed me to break down the app into smaller, easier to build chunks. I've laid out the versions below, along with the domain model for each (i.e. the classes along with their instance variables and methods)

### Version 1 - Version 1 - see menu

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

* Objects
	* Menu(.csv)
		* item, price
* Methods
  * loads Menu.csv on initialization
	* display
		* prints menu with header

I decided that my main class would be Order. I decided to keep the menu as a CSV file because I did not need to add or change elements.

### Version 2 - create order

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

* Objects
	* Order
		* @basket = []
		* @total
	* Menu(.csv? or hash?)
* Methods
  * select(dish)
	  * add_to_order
	  * increase_total
	* view_menu
	* view order
		* (include qty)
	* check_total

### Version 3 - place order and send confirmation text
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as “Thank you! Your order was placed and will be delivered before 18:52” after I have ordered
```

* Objects
	* Order
		* @basket = []
		* @total(?)
	* Menu(.csv? or hash?)
* Methods
	* add_to_order
		* increase_total
	* view_menu
	* view order
		* include qty
	* check_total
	* place_order
		* send_text
