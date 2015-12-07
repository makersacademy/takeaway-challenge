Takeaway Challenge
==================

Instructions and User notes
-------

* There are three classes in the program; Restaurant, Msg, and Menu. Restaurant is the main class - Msg and Menu are injected classes of Restaurant.

* To use the program, first run 'Bundle' to install the gems. Then create a new instance of the Restaurant class. You can use the methods 'request_menu' and 'order'. The order method will print instructions to the screen - make sure that you use the format shown, or your order will not complete properly. A mistake in calculating the total at the end will also cause your order to fail.

* The Menu class simply provides the menu. As this class is injected in to Restaurant, this allows the Restaurant class to use different menus easily.

* The purpose of the Msg class is to send a confirmation text to the user that their order has been received, along with an expected delivery time. In order to use this class, you will need to add in your Twilio details where shown by the comments.


Incomplete parts
-----
* The test coverage is not high enough. This is because I have not been able to find a suitable way to test the #order method in the Restaurant class (which both outputs to STDOUT and uses STDIN to change a variable), and most processes rely on this method.

User Stories
-----

* The Takeaway program was written to satisfy the following user stories:

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
