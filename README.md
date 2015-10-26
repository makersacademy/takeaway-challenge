#Takeaway Challenge
==================

My approach to the takeaway challenge is quite simple, there are two classes, the Takeaway and the Menu, and a supporting module  MenuTypes, which contains a CONST array of different menu types.

The Takeaway is the way the user interacts with the program.  There are several commands which have been implemented which (hopefully) satisfy the User Stories.


#Instructions
-------

####Below is an example of how the ordering system is meant to work.

**[1] pry(main)> require './lib/takeaway.rb'**<br/>
=> true<br/>
**[2] pry(main)> t = Takeaway.new**<br/>
=> #<Takeaway:0x007fe80c836ac0<br/>
 @menu=<br/>
  #<Menu:0x007fe80c836a98<br/>
   @menu=<br/>
    [{:food=>"Salt and Pepper King Prawn", :price=>3.99, :quantity_ordered=>0},<br/>
     {:food=>"Pork Dumplings", :price=>2.5, :quantity_ordered=>0}]>,<br/>
 @twilio=<br/>
  <Twilio::REST::Client @account_sid=AC0d5ab4e4089ccba3ffa0d6e307f3220d>><br/>
**[3] pry(main)> t.request_menu**<br/>
Salt and Pepper King Prawn - £3.99<br/>
Pork Dumplings - £2.50<br/>
=> [{:food=>"Salt and Pepper King Prawn", :price=>3.99, :quantity_ordered=>0},<br/>
 {:food=>"Pork Dumplings", :price=>2.5, :quantity_ordered=>0}]<br/>
**[4] pry(main)> t.add("Salt and Pepper King Prawn", 12)**<br/>
=> [{:food=>"Salt and Pepper King Prawn", :price=>3.99, :quantity_ordered=>12},<br/>
 {:food=>"Pork Dumplings", :price=>2.5, :quantity_ordered=>0}]<br/>
**[5] pry(main)> t.add("Pork Dumplings")**<br/>
=> [{:food=>"Salt and Pepper King Prawn", :price=>3.99, :quantity_ordered=>12},<br/>
 {:food=>"Pork Dumplings", :price=>2.5, :quantity_ordered=>1}]<br/>
**[6] pry(main)> t.view_current_order**<br/>
=> "Salt and Pepper King Prawn x12: £47.88, Pork Dumplings x1: £2.50, Total: £50.38"<br/>
**[7] pry(main)> t.checkout(50.37)**<br/>
RuntimeError: Total provided does not match order total!  Please try again<br/>
from /Users/andydowell/Projects/Makers-Academy/takeaway-challenge/lib/takeaway.rb:29:in `checkout'<br/>
**[8] pry(main)> t.checkout(50.38)**<br/>
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/AC0d5ab4e4089ccba3ffa0d6e307f3220d/Messages/SM32621c318c784c7f80f45f146ef4a9c8><br/>
=> Text send to my phone with "Sent from your Twilio Trial account - Your order has been accepted!  Salt and Pepper King Prawn x12: £47.88, Pork Dumplings x1: £2.50, Total: £50.38 will arrive by 10:13"<br/>