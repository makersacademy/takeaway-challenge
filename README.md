# TakeAway - simple ruby restaurant software.
 A simple ruby program to help you create and manage menus, meals, orders, and sms order confirmation using the TWILIO api.
 
 The objective of this program was to satisfy the specification brief given by a client who wants to be able to order food from a takeaway and receive confirmation of their order by sms. The user stories were given as follows:
 
>As a customer
>So that I can check if I want to order something
>I would like to see a list of dishes with prices
>
>As a customer
>So that I can order the meal I want
>I would like to be able to select some number of several available dishes
>
>As a customer
>So that I can verify that my order is correct
>I would like to check that the total I have been given matches the sum of the various dishes in my order
>
>As a customer
>So that I am reassured that my order will be delivered on time
>I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

 This program was written as a solution to a challenge at www.MakersAcademy.com . The orginal challenge can be found at https://github.com/makersacademy/takeaway-challenge
# Setting up
 - Create a new folder for this project
 - Fork this repo into your github profile
 - Run bundle
```sh
$ mkdir MyTakeAway
$ cd MyTakeAway
$ git clone github.com/[...YOUR GIT NAME...]/takeaway
$ bundle install
```
 
# Testing 
You now have a copy of this project. Inside the project you will find spec files that you can use to test this program. to do so make sure ruby ```rspec``` gem is installed.
```sh
$ gem install rspec
```
 - Navigate to the project folder
 - then run ```$ rspec ```

```sh
$ cd MyTakeAway
$ rspec
```
# Getting started

## 1. Creating a new Takeaway

Once you have verified the rspec tests are passing and you are now bathing in a glory of green lights.
you can safely assume you can use this takeaway program with relevant ease.

First things first, fire up your IRB and require the file (make sure you are already in the project folder when you do this) :
```sh 
$ irb
2.2.3 :001 > require './lib/take_away.rb'
 => true 
```
To create a new Takeaway object.
The ``` Takeaway``` class takes 3 arguments (Name_of_takeaway,  Phone_No ,Address)
```sh
2.2.3 :003 > new_takeaway = Takeaway.new("Sandys Sandwiches","38, King Street, NW5 4LQ","+555-666")
=> <Takeaway:0x007f9b4a0c61c8 @name="Sandys Sandwiches", @tel="+555-666", @address="8 King Street NW5 4LQ", @menus=[], @orders=[]> 
```

You Now have a Takeaway. This take away will accept a ```Menu``` object and a ```Order``` object and store it in the ```@menus``` and ```@orders``` attributes of the Takeaway. To do this you have two handy methods at your disposal:
 
 - ```Takeaway#create_menu ```
 - ```Takeaway#create_order```

## 2. Creating New Menus

To continue our example above we can use these methods on the ```new_takeaway``` we created by simply calling the ```create_menu``` method on it. This will give us a new menu object and pass that to the takeaways menus attribute as one of possibly many menus the takeaway may choose to offer. lovely job!

## 3. Creating a New Order
 You now have a menu from which you can order
 
## 4. Adding Meal Items to Cart.
 
## 5. Finalise order with SMS confirmation
 
 
## Appendix. Program Stucture - chain of command.
 
 
|               |Takeaway       |       |
|:-------------:|:-------------:|:-----:|
| menu          |  order        |message|
| meal          |

 
 

 









