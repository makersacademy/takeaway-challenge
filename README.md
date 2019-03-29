# Takeaway Challenge

For this Challenge we are going to make a takeaway application for a customer. We will focus on TDD and OOD to find a solution for the Challenge.

### User stories
>As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

>As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

>As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

>As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

### Approach

list menu (only listing?)
order (store dishes)
dishes (data and print)

We want to have a menu class method to list the menu beforehand, in the menu we will store the dishes we have available (load from file?)

The dishes will have the information of the dishes itself and will print themselves.

Order will add items from the menu object given and its quantity. We will use the id of the dishes to add them to the order.


#### Dish
In this class we will store the information of the dish (name, price and id) and puts methods to print it.


#### Menu
We will have a list of the available dishes for the customer to select from. Will give the desired dish by id when requested by the order.

#### Order
Give the tools to the customer to add, remove, check and place the order. It will have one dish item per quantity, given by menu.
