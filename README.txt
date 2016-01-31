Week two w/e challenge 						30th January 2016

		     			Takeaway Challenge

Installation Instructions

1. Go to the link below and fork the repository 
(note: you will need to be signed in to your GitHub account to view or fork)

	https://github.com/rachelsmithcode/takeaway-challenge

2. Clone the repository by typing: 

	$ git clone <the SSH or HTTP link from your new forked repo on your GitHub 		  account>

(note: Make sure you are in the directory that you wish the takeaway challenge folder and it’s contentce to be stored in. Cloning creates the new directory so there is no need to make a takeaway directory)

3. To install the gem files run the command:

	$ bundle 

(note: If this returns an error you may need to install the bundler gem first, using the command: $ gem install bundler
for further details check the website: http://bundler.io)


User Stores to Cover

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


My Approach to this Challenge

Yummy Sushi Restaurant (because Sushi is the best food ever and we should get more fake orders that way because test cases love sushi.)

The customer needs to be able to view the menu items, names and associated prices. 
The customer needs to be able to select items from the menu which should be stored in a basket.
The customer needs to be able to place their order from the basket, check the price is correct and receive a text confirming their order and when it is due to be delivered. 

So…

We need a menu class, an item class, an order class and a kind of interface that greets the customer, allow them to see the menu and start a new order. 

I believe the flow will go along the lines of:

items -> menu -> interface -> order -> sends texts

As items is the first thing that the other classes draw from I will start TDD from there. This should allow me to build on the program and limit the need to split off classes later. 






