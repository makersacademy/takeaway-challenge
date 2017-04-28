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
 ```
 As a customer
 So that I can check if I want to order something
 I would like to see a list of dishes with prices
 ```

 |Objects               | Messages      |
 |----------------------|:-------------:|
 |Customer              |               |
 |Order                 |list           |
 |See                   |dishes - prices|


 ```
 As a customer
 So that I can order the meal I want
 I would like to be able to select some number of several available dishes
 ```

 |Objects               | Messages        |
 |----------------------|:---------------:|
 |Customer              |                 |
 |Order                 |meal             |
 |Select                |dishes - quantity|


 ```
 As a customer
 So that I can verify that my order is correct
 I would like to check that the total I have been given matches the sum of the various dishes in my order
 ```

 |Objects               | Messages      |
 |----------------------|:-------------:|
 |Customer              |               |
 |Order                 |meal           |
 |Check                 |total          |


 ```
 As a customer
 So that I am reassured that my order will be delivered on time
 I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
 ```

 |Objects               | Messages      |
 |----------------------|:-------------:|
 |Customer              |               |
 |Order                 |meal           |
 |Receive               |SMS            |

 =================

 ## Methodology

 1. First break down the user stories and identify nouns and verbs to determine the classes and methods that would be required.

 2. Created a files for each class: `Takeaway` and `Menu`.

 3. Created spec files for each class: 'takeaway_spec.rb' and 'menu_spec.rb'.

 4. Started writing tests to check functionality.

 5. Used 'rubocop' to ensure best practice formatting.

 6. Add methods to the corresponding classes to pass the tests.

 =================

 ## How to use

 Bellow is a pry transcript of how the program runs from a users perspective:

```
[1] pry(main)> require './lib/order'
=> true
[2] pry(main)> dominos = Takeaway.new
=> #<Takeaway:0x007ffb1a87f858
 @order=
  #<Order:0x007ffb1a87f808
   @customer_order={},
   @menu=
    {:Milano=>19.99,
     :Ardente=>19.99,
     :Sicilia=>19.99,
     :Verona=>19.99,
     :Roma=>19.99}>>
[3] pry(main)> dominos.order.add_item(:Roma, 5)
=> 5
[4] pry(main)> dominos.order.add_item(:Margherita, 2)
RuntimeError: Item is not on the menu.
from /Users/anthonycrisp/Desktop/Projects/TakeAway/takeaway-challenge/lib/order.rb:15:in `add_item'
[5] pry(main)> dominos.order.add_item(:Milano, 1)
=> 1
[6] pry(main)> dominos.order.summary
Roma x 5
Milano x 1
Your total: £119.94
=> nil
[7] pry(main)> dominos.order.send_sms(+44**********)
=> "sent"
[8] pry(main)>
```
