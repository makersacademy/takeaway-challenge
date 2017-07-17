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

* Sending text message has been stubbed out and hence the following lines of code will not run via rspec
  - messenger.rb lines 15-16
  - order.rb lines 56-58

To check that test coverage is 100% comment one of the occurrences of the following line in order_spec.

```
allow(order).to receive(:send_text_message).and_return("Success")
```

* The following environment variables have to be set up in order to be able to send the text message
  - ACCOUNT_SID - # Account SID from www.twilio.com/console
  - AUTH_TOKEN - # Auth Token from www.twilio.com/console
  - FROM - # Your Twilio number
  - TO - # Your phone number

Create a twilio account and follow the instructions on twilio to get the values required for setting the ENV variables as mentioned above.

Example

```
2.4.0 :001 > require './lib/menu.rb'
 => true
2.4.0 :002 > require './lib/order.rb'
 => true
2.4.0 :003 > menu = Menu.new("Dominos",
2.4.0 :004 >     "Cheese & Tomato", 6,
2.4.0 :005 >     "Mighty Meaty", 9,
2.4.0 :006 >     "Pepperoni Passion", 8,
2.4.0 :007 >     "Tandoori Hot", 9,
2.4.0 :008 >     "Vegi Sizzler", 8)
 => #<Menu:0x007fae59301880 @name="Dominos", @dishes={"Cheese & Tomato"=>6.0, "Mighty Meaty"=>9.0, "Pepperoni Passion"=>8.0, "Tandoori Hot"=>9.0, "Vegi Sizzler"=>8.0}>
2.4.0 :009 > order = Order.new(menu)
 => #<Order:0x007fae592f3668 @menu=#<Menu:0x007fae59301880 @name="Dominos", @dishes={"Cheese & Tomato"=>6.0, "Mighty Meaty"=>9.0, "Pepperoni Passion"=>8.0, "Tandoori Hot"=>9.0, "Vegi Sizzler"=>8.0}>, @basket={}, @total=0, @placed=false>
2.4.0 :010 > puts order.read_menu
Dominos Menu
Cheese & Tomato                6.00
Mighty Meaty                   9.00
Pepperoni Passion              8.00
Tandoori Hot                   9.00
Vegi Sizzler                   8.00
 => nil
2.4.0 :011 > order.add("Vegi Volcano", 2)
 => "Cannot add, Vegi Volcano is not on the menu"
2.4.0 :012 > order.add("Vegi Sizzler", 1)
 => "1x Vegi Sizzler added to your basket"
2.4.0 :013 > order.add("Tandoori Hot", 2)
 => "2x Tandoori Hot added to your basket"
2.4.0 :014 > order.add("Vegi Sizzler")
 => "1x Vegi Sizzler added to your basket"
2.4.0 :015 > order.basket
 => {"Vegi Sizzler"=>2, "Tandoori Hot"=>2}
2.4.0 :016 > order.total
 => 34.0
2.4.0 :017 > order.checkout(30)
 => "Incorrect amount"
2.4.0 :018 > order.checkout(34)
 => "Success"
2.4.0 :019 > order.placed?
 => true
2.4.0 :020 > order.add("Cheese & Tomato")
 => "Cannot add, order already placed"

```


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

Classes
-----

#### Menu

##### Attributes

* name:     Menu name
* dishes:   A hash where the key is the dish name and the value is the dish price

##### Methods

* new

|Argument |Optional?|Type                                             |
|:-       |:-       |:-                                               |
|name     |No       |String                                           |
|*dishes  |No       |String, Numeric, String, Numeric ...             |

\* dish name, dish price, dish name, dish price ...

* dishes

Takes no arguments

Returns a hash of the format { key: dish_name value: dish_price }

* to_s

Takes no arguments

Returns a formatted string with values of name, dish name, dish price ...

##### Design Notes

The ability to add a dish to the menu has not been implemented on purpose. This is because all user stories are from the perspective of a 'customer' wanting to place an order at which point it is a reasonable expectation that a menu already exists. Adding a dish to the menu is an action from the perspective of the 'restaurant owner / manager' and a feature that has not been asked.

#### Order

##### Attributes

* basket:   A hash where the key is the dish name and the value is the quantity
* total:    The total amount for the items in the basket

##### Methods

* new

|Argument |Optional?|Type                                             |
|:-       |:-       |:-                                               |
|menu     |No       |Menu                                             |

* read_menu

Reads the menu by calling to_s method of menu

* placed?

True / False - Tells if the order has been placed

* add

|Argument       |Optional?|Type                                        |
|:-             |:-       |:-                                          |
|dish_name      |No       |String                                      |
|quantity       |Yes      |Number, Default 1                           |

Before adding it checks that the order has not already been placed, and that the item is on the menu. It updates the basket and calls the method that updates the total. It returns a message.

* checkout

|Argument       |Optional?|Type                                       |
|:-             |:-       |:-                                         |
|amount         |No       |Number                                     |

Before checking out it checks that the basket isn't empty, and that the amount is correct. It calls the method that sends a text message indicating a delivery time of 1 hour.

#### Messenger

##### Methods

* send_message

|Argument       |Optional?|Type                                        |
|:-             |:-       |:-                                          |
|text           |No       |String                                      |

Using the twilio gem it sends the text
