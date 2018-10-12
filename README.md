# Takeaway Challenge

## Goals

* A weekend project for week 2 of Makers.
* Goal was to learn more about object oriented programming, and test-driven development, by creating a takeaway program that satisfies the following user stories:

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

## My Approach

* Dishes have a name, and a price.
* The menu stores an array of dishes. It can be initialized with dishes, and dishes can be added and deleted. The user can view its dishes and their prices in the standard output.
* An order stores the dishes the user wishes to have delivered. Users can add to the order, delete items from the order, and view the dishes in their order with their quantities and prices.
* Adding and deleting behaviour is defined in a separate module included in the Menu and Order classes, to avoid repetition.
* The restaurant is responsible for placing the user's order. Restaurants will first check the total provided to ensure it is accurate, before using the texter to send a confirmation text to the user.
* The texter is respondible for sending texts, using the Twilio API.

## How to Use

* Open irb
* Require all the files in /lib
* Create some dishes:

```
> pizza = Dish.new("pizza", 10)
> pasta = Dish.new("pasta", 15)
```

* Create a menu and view it:

```
> menu = Menu.new([pizza, pasta])
> menu.view
~~~Menu~~~
pasta, £15
pizza, £10
```
* Create an order, add some dishes to it, and view it:

```
> order = Order.new
> order.add(pizza, pizza, pasta)
> order.view
pizza x2 = £20
pasta x1 = £15
Total = £35
```

* Create a restaurant and place the order, with the correct total:

```
> restaurant = Restaurant.new
> restaurant.place(order, 30)
RuntimeError: Incorrect total.
> restaurant.place(order, 35)
```

* You should now receive a text telling you when your order will arrive.
