[![Build
Status](https://travis-ci.org/travis-ci/travis-web.svg?branch=master)](https://travis-ci.org/travis-ci/travis-web)

## The Takeaway Challenge
This challenge requires us to build a program so that customer can order a takeaway. My approach to this challenge is to create 3 different classes.

- **TakeAway class**  
New instance of this class is always instantiated with an instance of the Message class, the Menu class and an empty items hash.
Under this class I have the following methods:    

**read_menu**:
it returns the list of dishes and their prices.  

**order**:
it is called with 2 arguments, a dish name and the quantity. it rely on a private method add_dish to add the dish and the quantity to the items hash and output a confirmation message.

**basket_summary**:
it returns a string made of all the active orders dish name and their quantity.

**total_price**:
it calculate the price of the order using the quantity and the dish price ordered then output a confirmation of the total.  

**complete_order**:
it takes a number as argument, this number represents the total price the customer came up with. If the customer total is different from the checkout price, an error is raised, otherwise a confirmation text message is sent to the customer with the total price and delivery time.

**add_dish**:
it takes 2 arguments,dish and quantity. This method is private and it allows the method order to keep track of what is ordered.  

- **Menu class**  
The menu class hold the list of dishes and their prices. This is the class which allows the class TakeAway method read_menu to display the menu.

- **Message class**  
The message class handle the confirmation message sent to the customer when the order is complete. I have used export command to add the twilio account sid, token, phone number to my environment so that I can protect my account information.

- **How to use this program?**
1. Create a new instance of class TakeAway  
2. Read the menu  
3. Order the dish you like  
4. View your order basket or/and order more if you want to    
5. Find out how much it will cost you  
6. Enter your own total  
7. A confirmation text message is sent to the registered phone number if the total you enter matches the program's one, otherwise you receive an error that the prices do not match.  

**Folders content**  
- The main code resides in folder lib  
- The test code can be found in spec

**Gem used in this challenge**
```ruby
gem 'rake'
gem 'rspec'
gem 'coveralls'
gem 'capybara'
gem 'twilio-ruby'
gem 'dotenv'
```


- irb test example
```
[1] pry(main)> require './lib/takeaway'
=> true
[2] pry(main)> t = TakeAway.new
=> #<TakeAway:0x007f90594ca4c8
 @items={},
 @menu=
  #<Menu:0x007f90594ca478
   @dishes=
    {"Crab"=>8.5, "Curry"=>9, "Soup"=>10.32, "Sandwich"=>12, "Steak"=>20}>,
 @message=#<Message:0x007f90594ca4a0>>
[3] pry(main)> t.read_menu
=> {"Crab"=>8.5, "Curry"=>9, "Soup"=>10.32, "Sandwich"=>12, "Steak"=>20}
[4] pry(main)> t.order("Crab")
=> "1x Crab(s) added to your basket."
[5] pry(main)> t.order("Curry", 2)
=> "2x Curry(s) added to your basket."
[6] pry(main)> t.order("Soup", 3)
=> "3x Soup(s) added to your basket."
[7] pry(main)> t.basket_summary
=> "Crab x1 = £8.5, Curry x2 = £18, Soup x3 = £30.96"
[8] pry(main)> t.total_price
=> "Total: £57.46"
[9] pry(main)> t.complete_order(52)
RuntimeError: The total you enter does not match checkout
from /Users/Basile/Desktop/makers_2017/projects/takeaway-challenge/lib/takeaway.rb:34:in `complete_order'
[10] pry(main)> t.complete_order(57.46)
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/AC8223672aa600138e595e1fbfe22ca710/Messages/SMfa84e767c18a41499cad77023453ab28>
[11] pry(main)>
```
