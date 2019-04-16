Takeaway Challenge
==================

This challenge was set as our second weekend challenge of the Makers Academy course. It really stretched my skills in Ruby and enabled me to practice everything I have learnt so far, such as TDD, effective debugging and object-oriented design. It was also my first attempt at implementing a test sending functionality using Twilio API, which I found challenging but really fun. I test drove the majority of this challenge but had to research the correct syntax for the Twilio API, which was very new to me.

Steps to run this program
-------
1. Clone this repo to your local machine
2. Run the command 'gem install bundle' (if you don't have bundle already)
3. When the installation completes, run 'bundle'

Using this program
-------
This is an example of how you could use this program in irb. You will need to 'require' the 'order.rb' file first:

```
irb
require './lib/order.rb'
```
To view the menu:
```
menu = Menu.new
menu.view_menu
```
To place a new order:
```
order = Order.new
```
You will need to pass through the item and the quantity as an argument, like so:
```
order.add_order ("pizza", 2)
order.add_order ("chips", 1)
```
To check what you have selected, call the 'selection' method, which will display everything in your order so far and the quantities:
```
order.selection
```
To see how much your order will cost you, call 'total':
```
order.total
```
To send the confirmation text
```
sms = Sms.new
sms.send_text
```
The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.

For security purposes, I used environment variables for the delivery and receiving phone numbers, as well as the Twilio auth token and account sid. These need to be set at from the command line as follows:

```
export TWILIO_PHONE=your Twilio number from your Twilio account
export TWILIO_DESTINATION_PHONE=your verified Twilio phone number (this was my personal mobile)
export TWILIO_AUTH_TOKEN=your auth token from your Twilio account
export TWILIO_ACCOUNT_SID=your account sid from your Twilio account
```
My Approach
-----
At the beginning of the challenge, I was given the following tasks and user stories. I have explained my approach to problem solving under each individual user story below:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
I would need a Menu class, responsible for containing a list of dishes with prices, which the user can see printed to the screen. I created my list of dishes as a hash, so it would be easy to access the key/value pairs (item/price) later on. I then added a 'view_menu' method which iterated over the hash and printed the dishes and prices to the screen in a more user-friendly and neat format - i.e. capital letters and £ signs before the prices.

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
Selecting dishes would not be the responsibility of the Menu class so I created an Order class that would be responsible for handling the selection process. I created an add_order method which would allow the user to select dishes by passing in the dish and the quantity as an argument. Their dish and the quantity would then be stored in a brand new hash, which I named 'selection'.
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
I created a 'total' method within the Order class. 'order_total' is set as a counter and then the total method iterates through the selection hash, multiplying the quantity of the dish by the price of the dish from the dishes hash in the Menu class. The 'order_total' counter is updated by the amount and the total amount printed as a string, so that the user can see the sum and check this against the price of the dishes in their order.

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
This user story was the most challenging. First of all I created a new class which would be responsible for sending this text - the Sms class. First of all I set the time to be one hour ahead (which I found from Ruby docs). I then used the Twilio API to implement the send_text function. I first tested this by hard-coding in the auth token, account sid and phone numbers but before pushing to Github I used environment variables, as explained above. When testing this in irb, an actual text does get sent to my phone with the time an hour ahead.


What I learned from this challenge
------------------
* More practice with object oriented design and ensuring that one class is only responsible for one thing
* Practice using hashes in Ruby
* Improving my TDD and debugging skills. I used the 'tighten the loop' method by 'p'ing out various lines to solve bugs in my code.
* How to work with third party APIs such as Twilio and ensure that the correct gems are installed.

Author/Acknowledgements
------------------
Jordan Roberts
Makers Academy Challenge
