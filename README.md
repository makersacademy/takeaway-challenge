Takeaway Challenge [![Build Status](https://travis-ci.org/omajul85/takeaway-challenge.svg?branch=master)](https://travis-ci.org/omajul85/takeaway-challenge) [![Coverage Status](https://coveralls.io/repos/github/omajul85/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/omajul85/takeaway-challenge?branch=master)
==================

**Author:** Omar Alvarez

Task
-----

Write a Takeaway program with the following user stories:

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

From user stories to classes
----------------------------

The application has been modeled using 4 classes: `Takeaway`, `Menu`, `Order` and `Notifier`. The class **Takeaway** is the one that models the actions of a customer that is ordering a takeaway. I have tried as much as I could to respect the Single Responsability Principle. Each class is responsable of a very precise task and the methods are as short and concise as possible. I think that the code is easy to read and the users should not have a lot of problems to extend the classes and interact with them on the irb. The class **Menu** needs to be initialized with a hash of dishes. The keys are strings that represent the dishes and the values are the desired price. The class has 2 methods, one for print the menu in a user friendly way and other for check if the dish is on the menu. The **Order** class must be initialized with a menu object. This is the class used to handle order, with actions like add dishes, remove dishes, calculate the total and print the current order. The class **Notifier** is in charge of sending the notification to the customer once the order is placed. The Twilio API has been used to do so.

Instructions
------------

From a user's perspective, this is how the application can be used (do not forget to require the files inside the irb):

```shell
$ irb
2.3.0 :001 > dishes = {"Chicken"=>4.5, "Pork"=>5.5, "Steak"=>9.3}
 => {"Chicken"=>4.5, "Pork"=>5.5, "Steak"=>9.3} 
2.3.0 :002 > m = Menu.new dishes
 => #<Menu:0x00000002571488 @dishes={"Chicken"=>4.5, "Pork"=>5.5, "Steak"=>9.3}> 
2.3.0 :003 > t = Takeaway.new m, Order, Notifier
 => #<Takeaway:0x00000002569008 @menu=#<Menu:0x00000002571488 @dishes={"Chicken"=>4.5, "Pork"=>5.5, "Steak"=>9.3}>, @order=#<Order:0x00000002568fb8 @dishes={}, @total=0, @menu=#<Menu:0x00000002571488 @dishes={"Chicken"=>4.5, "Pork"=>5.5, "Steak"=>9.3}>>, @notifier=#<Notifier:0x00000002568f40 @client=<Twilio::REST::Client @account_sid=ACe2****945a***e9300***d892a66*346>>> 
2.3.0 :004 > puts t.print_menu
Chicken: £4.50
Pork: £5.50
Steak: £9.30
 => nil 
2.3.0 :005 > t.select_dish 'Chicken'
 => 1 
2.3.0 :006 > t.select_dish 'Steak', 5
 => 5 
2.3.0 :007 > t.print_current_order
 => "Chicken x 1\nSteak x 5" 
2.3.0 :008 > t.total
 => 51.0 
2.3.0 :009 > t.pay 51
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/ACe2****945a***e9300***d892a66*346/Messages/SM3992ebc68d41476da6331aa3884dd433> 

```

After calling the method pay with the right amount, the sms is sent to the customer to confirm that the order was placed. See below:

![Image of Twilio SMS](https://github.com/omajul85/takeaway-challenge/tree/master/docs/twilio_sms.jpg)


