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


/////////////////

Breaking down the Customer stories into a Domain Model:

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


Object    | Message 
User      | Initial - 
              @order = nil ()

          |  Call menu class //// 
            
          |  new_order(unicorn) //
              @order = unicorn//

          |  add_to_order(itemm, qu)//
              @order.add_items(item, qu)//

          |  #return_order = @order.order//

          |  verify order is correct 
              
_________________________________________


Menu      | dishes and price (hash?) /// 
            Update menu


          

___________________________________________

Order     | Initialize/
            attr_read :order/
          | @current_items = {[]} / 
            
          | add_item(item, quantity)/
                        - return the order and the quantity to the user ****
                        - @current_items[:item] = quantity 
          | basket summary 
                        - Iterates the hash of arrays over the hash of the menu - get the correct amount /
                        
          | total takes the sum of all these values 
                        - returns to customer 

          | place_order 
                      - Interacts with messenger class to send text

____________________________________________

Messenger | 




_____________________________________________

To use my programme see the following irb:

irb
2.6.5 :001 > require './lib/user.rb'
 => true 
2.6.5 :002 > mx_smith = User.new
 => #<User:0x00007ff0950d9318 @order=nil, @menu=#<Menu:0x00007ff0950d92f0>> 
2.6.5 :003 > mx_smith.request_full_menu
 => {"spring rolls"=>0.99, "tofu curry"=>5.6, "coconut rice"=>2.5} 
2.6.5 :004 > mx_smith.new_order
 => #<Order:0x00007ff0940eb9d8 @current_items={}, @menu={"spring rolls"=>0.99, "tofu curry"=>5.6, "coconut rice"=>2.5}> 
2.6.5 :005 > mx_smith.add_to_order("spring rolls", 4)
 => "You have added spring rolls x 4" 
2.6.5 :006 > mx_smith.add_to_order("tofu curry", 5)
 => "You have added tofu curry x 5" 
2.6.5 :007 > mx_smith.review_basket
 => ["spring rolls, x4, £3.96", "tofu curry, x5, £28.0"] 

_________________________

As you can see above the User Class acts is how you interact with the rest of the classes. I do not think this is the best way to call the classes as it makes the User class extremely dependant of the others, especially Order. However it does allow for Menu/ Order to pretty independent.


_________________________        
  

Did not get round to::

  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Rubocop 

How I would move forward: 
- I would have used the GIT ignore file to hide number or dotenv
- Refactor the classes and add some private methods to ensure there is the correct encapsulation
- Ensure that the Rubocop is ran





