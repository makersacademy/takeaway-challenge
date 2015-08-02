Takeaway Challenge
==================

This is my second weekend challenge at Makers Academy. The task was to create a Takeaway program for the user stories below. I used the Twilio API for setting up the text send functionality

User Stories
--------------
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

Classes
--------
The aim of the challenge was to test our object orientated domain design skills with single responsibility and dependency injection inversion. I used four classes for the program

* **Menu:** responsible for holding the list of dishes and prices
*  **Order:** responsible for holding the order information.
* **Restaurant:** responsible for placing the order
* **Messenger:** responsible for sending the order confirmation message

Each class was designed to be dependant from the other classes and can be used in other programs if needed. For example the order class is not dependant on being in a takeaway program.

I also designed the program with the open close principle in mind.The menu has no default list of dishes it has to have the dishes provided at initialzise of the menu. The restaurant class has beed designed to create instances of the Menu and Messenger classes on creation. However this is not dependant on the classes being the classes I have created. Restaurant can take any class that responds to the methods in Messenger and Menu

Running Instructions
=======
Program can be run via IRB. To use the the text message sending functionality twilio-ruby gem is required.

in IRB to initialise the restaurant enter the restaurant with a options hash with contains needs to contain a has such as the one below

```
restaurant = Restaurant.new({ menu: Menu , options: { dishes: { rice: 10.99, pizza: 5.99 } } messenger: Messenger})
```
menu and messenger are the classes which will  be initialised as the messenger and menu . Options:dishes: is the the dishes for the menu an the prices.

to place an order an instance on the order class needs to be created with items required and contact phone number.
```
order = Order.new( { items: { rice: 1, pizza: 1 }, total: 16.98, contact_number: '+440XXXXXXXXXX'}  )
```
place order that them be run to check if the order is valid or not.

```
restaurant.place_order(order)
```

a text message will be sent with delivery time of order is successful