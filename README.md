Takeaway Challenge
==================
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

Instructions
-------

* The project's functionality is demonstrated in the last feature spec found in feature specs folder takeaway-challenge/feature_spec

User Stories
-----

The project implements the following user stories.

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

Design
-----

#### Menu

##### Attributes

- name:     Menu name
- dishes:   A hash where the key is the dish name and the value is the dish price

##### Methods

- new

|Argument |Optional?|Type                                             |
|:-       |:-       |:-                                               |
|name     |No       |String                                           |
|*dishes  |No       |String, Numeric, String, Numeric ...             |

\* dish name, dish price, dish name, dish price ...

- dishes

Takes no arguments

Returns a hash of the format { key: dish_name value: dish_price }

- to_s

Takes no arguments

Returns a formatted string with values of name, dish name, dish price ...

##### Design Notes

The ability to add a dish to the menu has not been implemented on purpose. This is because all user stories are from the perspective of a 'customer' wanting to place an order at which point it is a reasonable expectation that a menu already exists. Adding a dish to the menu is an action from the perspective of the 'restaurant owner / manager' and a feature that has not been asked.

Example

```
2.4.0 :001 > require './lib/menu.rb'
 => true
2.4.0 :002 > menu = Menu.new("Dominos", "Cheese & Tomato", 6, "Mighty Meaty", 9, "Pepperoni Passion", 8, "Tandoori Hot", 9, "Vegi Sizzler", 8)
 => #<Menu:0x007ffd5d0cc300 @name="Dominos", @dishes={"Cheese & Tomato"=>6.0, "Mighty Meaty"=>9.0, "Pepperoni Passion"=>8.0, "Tandoori Hot"=>9.0, "Vegi Sizzler"=>8.0}>
2.4.0 :003 > puts menu
Dominos Menu
Cheese & Tomato                6.00
Mighty Meaty                   9.00
Pepperoni Passion              8.00
Tandoori Hot                   9.00
Vegi Sizzler                   8.00
 => nil
```
