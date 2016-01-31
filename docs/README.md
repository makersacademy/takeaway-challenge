Takeaway Challenge
==================

Approach
-------
The takeaway contains three classes: Menu, Order and Text. Menu is self-explanatory, Text uses twilio-ruby to send a confirmation text/sms that the order will be dispatched in one hour. Order is the largest of the classes.

In order, the customer can see the menu, make a selection of which dishes and how many they want to have of each, see their current selection and how much it will cost and place the order.

Installation


User stories to solve
-------

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

Installation
-------
```
1. Git clone the repository
2. Gem install bundle
3. Bundle install
```

To receive the SMS messages you will have to make a (free) Twilio account and then set up three environment variables: ACCOUNTSID= Your Twilio Account SID.
AUTHTOKEN= Your Twilio Auth Token.
MYPHONE= A verified phone number to receive the messages.
You can set these globally or just in the file .env in the project root.

Usage
-------
```
