#Takeaway Challenge
==================

My approach to the takeaway challenge is quite simple, there are two classes, the Takeaway and the Menu, and a supporting module  MenuTypes, which contains a CONST array of different menu types.

The Takeaway is the way the user interacts with the program.  There are several commands which have been implemented which (hopefully) satisfy the User Stories.


#Instructions
-------

####Below is an example of how the ordering system is meant to work.

**[1] pry(main)> require './lib/takeaway.rb'**\s\s
=> true\s\s
**[2] pry(main)> t = Takeaway.new**\s\s
=> #<Takeaway:0x007fe80c836ac0\s\s
 @menu=\s\s
  #<Menu:0x007fe80c836a98\s\s
   @menu=
    [{:food=>"Salt and Pepper King Prawn", :price=>3.99, :quantity_ordered=>0},
     {:food=>"Pork Dumplings", :price=>2.5, :quantity_ordered=>0}]>,
 @twilio=
  <Twilio::REST::Client @account_sid=AC0d5ab4e4089ccba3ffa0d6e307f3220d>>
**[3] pry(main)> t.request_menu**
Salt and Pepper King Prawn - £3.99
Pork Dumplings - £2.50
=> [{:food=>"Salt and Pepper King Prawn", :price=>3.99, :quantity_ordered=>0},
 {:food=>"Pork Dumplings", :price=>2.5, :quantity_ordered=>0}]
**[4] pry(main)> t.add("Salt and Pepper King Prawn", 12)**
=> [{:food=>"Salt and Pepper King Prawn", :price=>3.99, :quantity_ordered=>12},
 {:food=>"Pork Dumplings", :price=>2.5, :quantity_ordered=>0}]
**[5] pry(main)> t.add("Pork Dumplings")**
=> [{:food=>"Salt and Pepper King Prawn", :price=>3.99, :quantity_ordered=>12},
 {:food=>"Pork Dumplings", :price=>2.5, :quantity_ordered=>1}]
**[6] pry(main)> t.view_current_order**
=> "Salt and Pepper King Prawn x12: £47.88, Pork Dumplings x1: £2.50, Total: £50.38"
**[7] pry(main)> t.checkout(50.37)**
RuntimeError: Total provided does not match order total!  Please try again
from /Users/andydowell/Projects/Makers-Academy/takeaway-challenge/lib/takeaway.rb:29:in `checkout'
**[8] pry(main)> t.checkout(50.38)**
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/AC0d5ab4e4089ccba3ffa0d6e307f3220d/Messages/SM32621c318c784c7f80f45f146ef4a9c8>
=> Text send to my phone with "Sent from your Twilio Trial account - Your order has been accepted!  Salt and Pepper King Prawn x12: £47.88, Pork Dumplings x1: £2.50, Total: £50.38 will arrive by 10:13"