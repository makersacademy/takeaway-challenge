Takeaway Challenge
==================

This is my solution to the [Makers Academy Takeaway Challenge](https://github.com/makersacademy/takeaway-challenge).

Using the user stories I created three classes(Order,CalculateBill,Message) and a Menu module. I combined these, using their associated methods, to match the user stories. I used [Twilio](https://www.twilio.com/) to send a comfirmation SMS when the order had been proccessed. I used Rspec to feature test and unit test my code, using TDD. 

Instructions
------------

```You can use the program by first requiring the file:

  2.2.3 :001 > require "./lib/order"

creating a new order:

  2.2.3 :002 > order = Order.new

see the menu:

  2.2.3 :003 > order.show_menu
  
  Margherita  £11.99
  Fiorentina  £12.99
  Vegeteriano  £10.99
  Formaggio  £12.99
  Siciliana  £13.99

choose from the menu:

  2.2.3 :004 > order.choose("Vegeteriano",1)
  2.2.3 :005 > order.choose("Formaggio",1)

calculate total cost:

   2.2.3 :006 > order.total_cost
   => 23.98 

check the total cost:

  2.2.3 :007 > order.check_total =>
  "1.0 X Vegeteriano(10.99) = 10.99"
  "1.0 X Formaggio(12.99) = 12.99"

recieve a confirmation message:

  2.2.3 :008 > order.send_message```


Created by Matt Gough (mattpgough@gmail.com)
