Takeaway Challenge
==================

 
![id](http://i.imgur.com/i9ddqj9.png?1)


Ruby program that replicates basic functionality of a Takeaway restaurant. Responsibility is split between several classes:
 - Client - requires menu from a specific restaurant, places order and confirms order
 - Menu - keeps a list of items available for Restaurant
 - Restaurant - gives client the menu and registers the final order(food items, total and client phone number) as well as send sms confirmation
 - Order - deals with input from client, checks only items from the menu are ordered and calculates total
 - Service_sms - API used by Restaurant class to send sms, currently sensitive info is hidden using 'dotenv gem'

 ************************************************************
 ###### Example of how the program is run:

![ScreenShot](https://raw.githubusercontent.com/Corina/takeaway-challenge/master/docs/Screenshot.png)

#### How to install it
- Fork this repo
- Run the command 'bundle' in the project directory to ensure you have all the gems

#### Missing functionality
 - Restaurant class: confirm_order method is not completed, it's set to return true
 - Other functionalities to be added: Bank class to deal with money transfer from client to restaurant

#### How to test it
 - use rspec and rubocop
