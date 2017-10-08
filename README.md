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

 Approach
 --------

 - Created a Takeaway program to allow a customer to choose dishes from a menu and place an order. An order confirmation is sent to the customer by text.
 - 2 classes: Takeaway and Order.
 - The order object is created by a 'new order' method in Takeaway.
 - Used the Twilio API to send the SMS.
 - The total price is used to finalise the order, allowing an error to raise if that is not the correct total.


 Install
 -------

 1. Fork this repo, and clone to your local machine
 2. Run the command `gem install bundle` (if you don't have bundle already)
 3. When the installation completes, run `bundle`

 Usage
 -----

 example usage below:

 ```
 [1] pry(main)> require './lib/takeaway.rb'
 => true
 [2] pry(main)> require './lib/order.rb'
 => true
 [3] pry(main)> thai = Takeaway.new
 Welcome to Pad Thai.
 => #<Takeaway:0x007ffbdbae0a18
  @menu=
   {"Spring Rolls"=>4,
    "Crispy Prawns"=>5,
    "Pork Skewers"=>6,
    "Tom Yum"=>7,
    "Green Curry"=>7,
    "Chang Beer"=>2},
  @phone_number=447814548040>
 [4] pry(main)> thai.new_order('Tim')
 => #<Order:0x007ffbdac85400 @dish_list=[], @name="Tim">
 [5] pry(main)> thai.select_dish("Spring Rolls", 4)
 => 4
 [6] pry(main)> thai.select_dish("Chang Beer", 6)
 => 6
 [7] pry(main)> thai.verify_order
 => "[{\"Spring Rolls\"=>4}, {\"Spring Rolls\"=>4}, {\"Spring Rolls\"=>4}, {\"Spring Rolls\"=>4}, {\"Chang Beer\"=>2}, {\"Chang Beer\"=>2}, {\"Chang Beer\"=>2}, {\"Chang Beer\"=>2}, {\"Chang Beer\"=>2}, {\"Chang Beer\"=>2}] 28"
 [8] pry(main)> thai.place_order(28)
 SM0594970ec36047f4841692e9fc0be628
 => nil
 [9] pry(main)>
 ```
 Unfinished business
 --------
Need to get the double working to stop the SMS sending when tests run
Began a menu class to move the menu across. Follow this through.
Improve the readability of returned hashes.
Add an interactive menu to minimise the user calling methods.

 Authors
 --------

 Tim Jones
