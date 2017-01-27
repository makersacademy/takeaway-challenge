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

 User Stories
 -----
 The following user stories are represented:

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

Running the Program
-----
* Clone this repo then run the command `bundle install` in the project directory to ensure you have all the gems
* Open up `IRB` or `PRY` and run the commands below
* In the final command `checkout`, User will also receive a text using the Twilio API

```
2.3.1 :002 > t = Takeaway.new
 => #<Takeaway:0x007ffc1b112d98 @menu=#<Menu:0x007ffc1b112d70>, @completed=false,
 @order=#<Order:0x007ffc1b112c58 @basket=[], @menu=#<Menu:0x007ffc1b112bb8>>>
2.3.1 :003 > t.get_menu
 => "Chicken £5.50, Lamb £2.40, Beef £3.60, Fish £4.50"
2.3.1 :004 > t.place_order("Lamb", 9)
 => "9x Lamb(s) added to your basket"
2.3.1 :005 > t.place_order("Chicken", 9)
 => "9x Chicken(s) added to your basket"
2.3.1 :006 > t.basket_summary
 => "Lamb x9 = £21.60, Chicken x9 = £49.50"
2.3.1 :007 > t.checkout
 => "Total: £71.10"
```
