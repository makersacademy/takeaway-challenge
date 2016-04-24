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

About
-------
The approach taken to solve this challenge was to create the following classes with the noted responsibility:

* takeaway - allow items to be added to the order
* menu - hold all menu items
* customer - checkout the order
* message - send a confirmation SMS via the Twilio API

Dependency inversion was used on the takeaway class to create instances of the menu class, and on the customer class to create instances of the message class.


Installation Instructions
-----
Fork this repo and clone to your machine.


Instructions
-----
Most of the interaction happens via the takeaway class, which has the following methods:
* menu - show the menu
* order - add an item to the menu
* basket - show what has been added to the order
* total - shows the total as a string message
* total_to_pay - shows the total as a float

```
[1] pry(main)> t = Takeaway.new
=> #<Takeaway:0x007ff5ac39b0f8
 @basket_items=[],
 @menu=#<Menu:0x007ff5ac39b0d0 @menu_items={"chicken jalfrezi"=>7.99, "onion bhaji"=>3.99, "naan"=>2.99, "rice"=>1.99}>,
 @total=0>
[2] pry(main)> c = Customer.new(t)
=> #<Customer:0x007ff5ac2ca070
 @takeaway=
  #<Takeaway:0x007ff5ac39b0f8
   @basket_items=[],
   @menu=#<Menu:0x007ff5ac39b0d0 @menu_items={"chicken jalfrezi"=>7.99, "onion bhaji"=>3.99, "naan"=>2.99, "rice"=>1.99}>,
   @total=0>>
[3] pry(main)> t.menu
=> {"chicken jalfrezi"=>7.99, "onion bhaji"=>3.99, "naan"=>2.99, "rice"=>1.99}
[4] pry(main)> t.order('chicken jalfrezi')
=> "1 chicken jalfrezi(s) added to your order"
[5] pry(main)> t.order('rice', 2)
=> "2 rice(s) added to your order"
[6] pry(main)> t.basket
=> "1 x chicken jalfrezi = £7.99, 2 x rice = £3.98"
[7] pry(main)> t.total
=> "Order total: £11.97"
[8] pry(main)> c.checkout(11.97)
```
