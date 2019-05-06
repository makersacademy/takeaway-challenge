# Takeaway Challenge #

  This program replicates a takeaway delivery service (specifically the online aspect of ordering food from a menu).

  I approached this challenge by using TDD and debugging with Rspec tests to reach my final version. I wrote out a Rspec test that described my aim and then followed the error messages to create source-code that corresponded to those errors.

  It acts as practice for my Ruby and Rspec skills, as well as introducing new skills (such as using Twilio to send texts using my code).

## What criteria should this program satisfy?
  - Prints the menu.
  - Ability to select food from the menu.
  - Check that the given total matches the sum of selected food.
  - Sends a text thanking you for your placed order, with delivery time attached.

## How to get this program

  1. Fork the repository onto your profile.
  2. Clone the repository onto your device.
  3. Run 'bundle' into your command line.
  4. Set up your .env file.
  5. You should be good to go!

## How to set up your .env file

  Create a `twilio.env` file and add the following code (ensure you replace the templates with your actual number, account sid, and auth token):

```shell
export TWILIO_ACCOUNT_SID='your_account_sid'
export TWILIO_AUTH_TOKEN='your_auth_token'
export PHONE='your_number'
```
  Add this file to your .gitignore file in order to avoid pushing your personal information to GitHub.

## How to use in irb

  Before starting irb, ensure you type this into your command line first.
```
source ./twilio.env
```
  Now you can start irb testing.

```shell
2.5.0 :001 > require './lib/takeout.rb'
 => true
2.5.0 :002 > takeout = Takeout.new
 => #<Takeout:0x00007ff6c053c938 @menu=#<Menu:0x00007ff6c053c910 @menu_list=["Mozzarella Sticks", "Garlic Bread", "Chicken Bites", "Margherita Pizza", "Pepperoni Pizza", "Vegetarian Pizza"]>, @order=[], @total_given=0>
2.5.0 :003 > takeout.add_order("Garlic Bread", 3, 11.97)
 => 3
2.5.0 :004 > takeout.add_order("Mozzarella Sticks", 1, 3.49)
 => 1
2.5.0 :005 > takeout.finish_order
Your total is £15.46. You have been sent a text to confirm.
```
