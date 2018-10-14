# Takeaway Challenge!
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

This is the week #2 weekend challenge for Makers Academy. The challenge is more advanced than the Airport Challenge, requiring use of a third party API to send texts, and more thorough application of SOLID principles.

## User Stories

We have the following user stories to implement in this project:

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

## My Approach

I tackled this challenge by creating 4 types of classes: Takeaway, Menu, Basket, and Text. I created 2 different menus, allowing the user to load the menu that they prefer when ordering dishes. The way to use the app is as follows:
* The preferred menu, the basket, and the text classes are loaded into the Takeaway class.
* The user can `list_dishes` to see the menu.
* Items can be added to the basket with `add_dish`, specifying the name of the item and the quantity. If the name given isn't on the menu, the user will see an error message.
* Using `view_basket` will show the current items in their basket, their quantities, and the total cost of that quantity.
* The user can then `place_order`, specifying the total cost of their basket. If the incorrect total is given, the user will see an error message and will have to enter the correct total.
* When the order is successfully placed, a confirmation text will be sent to the user's phone, thanking them for the order and giving them an ETA for delivery (+ 1 hour from the current time).

Because of the way I have structured my code, any type of menu, basket, or text class can be loaded into the takeaway, making the program much more flexible. All units are 100% isolated.

Twilio is used to send the texts. I used Webmock to test my texting system effectively without sending texts in the process.

## Example

Here is an example of my code being used:

```
2.5.0 :001 > require 'twilio-ruby'
 => true
2.5.0 :002 > Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| require(f) }
 => ["./lib/chinese_menu.rb", "./lib/text.rb", "./lib/basket.rb", "./lib/pizzeria_menu.rb", "./lib/takeaway.rb"]

 # After loading in the required files, the user creates a new Takeaway object, using the chosen menu, basket, and text classes
2.5.0 :003 > takeaway = Takeaway.new(PizzeriaMenu, Basket, Text)
 => #<Takeaway:0x00007fd39225e320 @menu=#<PizzeriaMenu:0x00007fd39225e2d0 @dishes=[{"Margherita"=>7.5}, {"Bufala"=>8}, {"Anchovy"=>8}, {"Pepperoni"=>8.5}, {"Calabria"=>8.5}, {"Quattro Formaggio"=>10}, {"Truffle"=>12.5}, {"Gold Pizza"=>1200}], @title="* * * PAPA'S * PIZZERIA * * *\n">, @basket_class=Basket, @basket=nil, @text=Text>

 # The list_dishes method can be used to view the menu (it will appear without whitespace until used outside of irb)
2.5.0 :004 > takeaway.list_dishes
 => "* * * PAPA'S * PIZZERIA * * *\n1) Margherita: £7.50\n2) Bufala: £8.00\n3) Anchovy: £8.00\n4) Pepperoni: £8.50\n5) Calabria: £8.50\n6) Quattro Formaggio: £10.00\n7) Truffle: £12.50\n8) Gold Pizza: £1200.00\n"

 # Dishes are added with their quantities, and an incorrect dish returns an error
2.5.0 :005 > takeaway.add_dish("Margherita", 2)
 => "Margherita x 2 added to the basket."
2.5.0 :006 > takeaway.add_dish("Pepperoni", 1)
 => "Pepperoni x 1 added to the basket."
2.5.0 :007 > takeaway.add_dish("Snail Pizza", 5)
Traceback (most recent call last):
        5: from /Users/Joel/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        4: from (irb):7
        3: from /Users/Joel/Makers/week2/takeaway-challenge/lib/takeaway.rb:14:in `add_dish'
        2: from /Users/Joel/Makers/week2/takeaway-challenge/lib/basket.rb:10:in `add_dish'
        1: from /Users/Joel/Makers/week2/takeaway-challenge/lib/basket.rb:24:in `find_name'
RuntimeError (Cannot find the specified dish!)
2.5.0 :008 > takeaway.add_dish("Gold Pizza", 1)
 => "Gold Pizza x 1 added to the basket."

 # The basket can be viewed at any time
2.5.0 :009 > takeaway.view_basket
 => [{:name=>"Margherita", :quantity=>2, :cost=>15.0}, {:name=>"Pepperoni", :quantity=>1, :cost=>8.5}, {:name=>"Gold Pizza", :quantity=>1, :cost=>1200.0}]

 # The order is placed, and a confirmation text is sent. An incorrect total given returns an error
2.5.0 :010 > takeaway.place_order(15 + 8.5 + 1300)
Traceback (most recent call last):
        3: from /Users/Joel/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):10
        1: from /Users/Joel/Makers/week2/takeaway-challenge/lib/takeaway.rb:19:in `place_order'
RuntimeError (Incorrect total given!)
2.5.0 :011 > takeaway.place_order(15 + 8.5 + 1200)
 => "Order placed! Look out for a confirmation text."
2.5.0 :012 > exit
```

The program can be run using `irb`. Tests are run using `rspec`.

:)
===========
