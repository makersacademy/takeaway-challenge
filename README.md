Takeaway Challenge
==================
The app allows users to order takeaway food. Users will receive a text when their order has come through.

This project was the Friday challenge on the second week of Makers.

Run locally
-------
* Clone this repo
* run bundle install
* Start irb
* load './lib/takeaway.rb'

User stories
-----
The app should satisfy these user stories. Look at the irb commands to see how to do this.  
To start interacting with the app, put the following into irb:
```
takeaway = Takeaway.new
```
**User story 1:**    
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
takeaway.see_menu
```

**User story 2:**    
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
takeaway.choose('Bolognese', 2)
takeaway.choose('Kotbullar')
```

**User story 3:**    
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
takeaway.check_order
```

**User story 4:**   
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
takeaway.place_order
```
For a more detailed description of how these commands should be working, see feature_test.md
