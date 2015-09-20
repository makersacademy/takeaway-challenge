
[![Code Climate](https://codeclimate.com/github/Harryandrew/takeaway-challenge/badges/gpa.svg)](https://codeclimate.com/github/Harryandrew/takeaway-challenge)


**Takeaway Challenge**
=================

Description
------------
Week 2 Makers Academy - Takeaway Challenge!
![Pizza](https://github.com/harryandrew/takeaway-challenge/blob/master/images/pizza_box.jpg)

Challenge - to write a takeaway application using a TDD/BDD approach, that sends a confirmation text message via the Twilio API.

Installation/Dependencies
--------------------------
- Ruby 2.2.0
- Rspec 3.3.2
- Coveralls 0.8.2
- Dotenv 2.0.2

run 'Bundler install' to download the relevant gems.

Instructions
--------------------------
**Run**     
_require './lib/user'_   
**Set yourself up:**  
_your_name = User.new_  
**View the menu!**   
_your_name.menu.show_  
**See something you like? Add it to the basket:**  
_your_name.add(your_name.menu.starters["Soup"])_  
**Checkout the total of your basket:**     
_your_name.total_  
**Happy with your order?**  
_Time to checkout... (remember to input price as an argument)_   
_your_name.checkout(price)_    

If the order is correct you will receive a text message with a confirmation of your order 

_n.b. In order to receive the text the user must have auth code setup as ENV Vars._  


Task
-----

* Write a Takeaway program with the following user stories:

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
Twilio Output
------

![iPhone Output](https://github.com/harryandrew/takeaway-challenge/blob/master/images/iPhone_output.png?raw=true)
