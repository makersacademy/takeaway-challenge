Takeaway Challenge
==================
BY, IRFAN DURRANI
github.com/durranee
==================
```
                            _________
              r==           |       |
           _  //            |  I.D. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
A simple takeaway system using Twillio for sms confirmation

### files ###
| /lib (main files) | /spec (tests) |
|---|---|
| order.rb | order_spec.rb  |
| menu.rb  | menu_spec.rb  |
| dish.rb  | dish_spec.rb  |
| send_sms.rb  | send_sms_spec.rb |

All methods and tests have comments and 100% tested using RSpec

#### Prerequisite
This ruby script requires a Twilio account with to work with Twillio SMS system.
A free account works just fine.
All credentials must be saved in /config/env.yml file as below
```
TWILLIO_ACCOUNT_SID: Your_Twillio_SID_Here
TWILLIO_AUTH_TOKEN: Your_Twillio_Auth_Token_Here
TWILLIO_PHONE: Your_Twillio_Phone_No_here
```
Check /config/env.yml.example for an example

### How to feature test in irb ###
 ```
 require './lib/dish'
 require './lib/menu'
 require './lib/order'
 require './lib/send_sms'

# --------------------------------------------------- #

# create an dish
# This takes 2 mandatory arguments <string>name <float>price
sb = Dish.new('Spaghetti Bolognese', 6.99)

# --------------------------------------------------- #

# to create a Menu
# this takes no arguments
# menu = Menu.new

# --------------------------------------------------- #

# to add dish to menu
# this takes one arguments <Dish object>
# menu.add(sb)

# --------------------------------------------------- #

# to print the menu
# this takes no arguments
# menu.list_all

# --------------------------------------------------- #

# create Order object
# this takes no arguments
# order = Order.new

# --------------------------------------------------- #

# to add a dish to cart
# this takes two arguments <dish object> and quantity <int>
# order.add_to_order(sb, 2)

# --------------------------------------------------- #

# to print cart contents
# this takes no arguments
# order.show_cart

# --------------------------------------------------- #

# to place order / checkout
# this takes 1 arguments <string> phone_number
# order.checkout(phone_number)

# --------------------------------------------------- #
 ```

 ### Example Run in irb ###
 ```
 $ irb
 2.5.0 :001 > require './lib/dish'
 => true
2.5.0 :002 > require './lib/menu'
 => true
2.5.0 :003 > require './lib/order'
 => true
2.5.0 :004 > require './lib/send_sms'
 => true
2.5.0 :005 >
2.5.0 :006 > phone_number = "+44799999992"
 => "+44799999992"
2.5.0 :007 > sb = Dish.new('Spaghetti Bolognese', 6.99)
 => #<Dish:0x00007fa816b8dab0 @name="Spaghetti Bolognese", @price=6.99>
2.5.0 :008 > lr = Dish.new('Lamb Roast', 11.99)
 => #<Dish:0x00007fa816b2fe60 @name="Lamb Roast", @price=11.99>
2.5.0 :009 > menu = Menu.new
 => #<Menu:0x00007fa8169c0de0 @menu=[]>
2.5.0 :010 > menu.add(sb)
 => [#<Dish:0x00007fa816b8dab0 @name="Spaghetti Bolognese", @price=6.99>]
2.5.0 :011 > menu.add(lr)
 => [#<Dish:0x00007fa816b8dab0 @name="Spaghetti Bolognese", @price=6.99>, #<Dish:0x00007fa816b2fe60 @name="Lamb Roast", @price=11.99>]
2.5.0 :012 > menu.list_all

==================================================
         Blah Blah Kitchen Menu         
==================================================
No.               Dish                       Price
--------------------------------------------------
1.        Spaghetti Bolognese                £6.99
2.             Lamb Roast                   £11.99
==================================================
 => nil
2.5.0 :013 > order = Order.new
 => #<Order:0x00007fa816a432e0 @send_sms_class=SendSMS, @cart=[]>
2.5.0 :014 > order.add_to_order(sb, 4)
 => [[#<Dish:0x00007fa816b8dab0 @name="Spaghetti Bolognese", @price=6.99>, 4]]
2.5.0 :015 > order.add_to_order(lr, 2)
 => [[#<Dish:0x00007fa816b8dab0 @name="Spaghetti Bolognese", @price=6.99>, 4], [#<Dish:0x00007fa816b2fe60 @name="Lamb Roast", @price=11.99>, 2]]
2.5.0 :016 > order.show_cart
------------------------------------------------------------
Dish                            Price    Quantity      Total
------------------------------------------------------------
Spaghetti Bolognese             £6.99       4         £27.96
Lamb Roast                      £11.99      2         £23.98
============================================================
Grand Total                                           £51.94
============================================================
=> nil
2.5.0 :017 > order.checkout(phone_number)
------------------------------------------------------------
Dish                            Price    Quantity      Total
------------------------------------------------------------
Spaghetti Bolognese             £6.99       4         £27.96
Lamb Roast                      £11.99      2         £23.98
============================================================
Grand Total                                           £51.94
============================================================
Please enter the total amount as listed above to place order
> 51.94
Thank you from Blah Blah Food! We're preparing your order and should be with you before #32:31.
Your total is £51.94
 ```
 ## Classes and methods ##
 ### Menu class methods ###
 ```
 # add(dish)
 # add methhod simply adds dish object to @cart[] if it doesn't
 # include already. If it does then throws error

 # remove(dish)
 # remove methhod removes dish object from @cart[] if it is in
 # there already. If not, then throws error

 # list_all()
 # list_all simply prints a @menu[] prettier
 ```

 ### Dish class methods
 ```
 # No public methods. Just initialize() method that takes name and price as arg
 ```

 ### Order class methods
 ```
 # add_to_order(dish, quantity)
 # add_to_order adds dish object and quantity provided to @cart[]

 # checkout(phone_number)
 # checkout takes phone number as argument and triggers request_confirmation
 # to confirm whether to process order or not, true = go ahead, false abort
 # this method will also throw error if @cart is empty

 # show_cart()
 # show_cart prints @cart contents prettier alongside pricing and grand total
 # calculated bu calculate_total

 # confirm_total()
 # confirm_total will ask the user to enter the full billing amount shown
 # and returns true if correct amount entered

 # request_confirmation(phone_number)
 # request_confirmation takes phone number as argument and creates an object of
 # SendSMS class in order to proceed with sending text message

## Private methods

# calculate_total()
# calculate total calculates and returns total amount from @cart after running
# .round(2) on it

 ```

 ### SendSMS class methods
 ```
 # send(phone_number, total)
 # main method for sending text, takes phone number and total amount as arg

 ## Private methods

 # delivery_message()
 # delivery_message simply returns the string to send as text

 # in_40_mins
 # in_40_mins returns Time.now + 40 mins as HH:MM

 ```
