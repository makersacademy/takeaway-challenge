## Takeaway Challenge

Weekend challenge (week 2) of Makers bootcamp. 
I created a takeaway program to meet these user story requirements: 
- customer can view a list of dishes with prices
- customer can order a meal they want, selecting some number of available dishes
- customer can verify order is correct by checking that the total they've been given matches the sum of various dishes in their order
- customer can be reassured that order will be delivered on time, therefore customer should receive a confirmation text after completing order (I used the Twilio API)

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


### My Approach
==================
###### Summary of my 5 classes: 
**Takeaway**: customer interacts with this class only. It calls on methods of other classes
**Order**: stores a record of dishes the customer has added to order (i.e. in @basket) and any other methods relating to the customer's order
**Menu**: stores a list of dishes. Dishes can be added to the menu. If there were Takeaway staff, they would interact with this class to update their menu.
**Dish**: stores name and price of each dish
**Message**: class to call on Twilio API and send text 

###### Takeaway
Used dependency injection to initialize this class with Menu.new and Order.new as default parameters. This means a previously produced menu or saved order could be injected into Takeaway.new.
Via this class, the customer can view menu, add an item to their order, view their order and check the total has been added correctly for the items in their basket.
When the customer completes their order via this class, complete_order method will call on the Message class, which, in turn,  handles the Twilio API messaging service, to send a confirmation text and display a confirmation message on screen.
Complete_order method passes the order's basket_total as a parameter to Message class' send method

###### Order
This class is responsible for any methods relating to the customer's order i.e. adding dishes to order, displaying the order, checking the basket total
nb: I'm not sure if there's a better way of doing check_total because I'm not sure my method is really doing much of a check

###### Menu
Stores a list of dishes as a hash. Hash keys are the names of dishes. Hash values are the associated prices.
@dishes is an accessor so that dishes can be added to @dishes. 

###### Dish
An instance of Dish class has name and price attributes that can be read by other classes, namely Menu

###### Message
An instance of Message class is initialized by the Takeaway's complete_order method, which also calls Message's send method
Send will invoke the Twilio API. It also calculates the arrival time by adding 60 minutes to the current time (Time.now) and formats it correctly to 24hr clock
Used I've used environment variables to protect confidential data needed for Twilio API (nb: I also created a twilio.env.template as an example of my twilio.env file which is not uploaded to github)

### Manual feature testing in irb | Example of a customer interaction with my Takeaway program 
==================
```
katbrooks@Kats-Air takeaway % irb -r ./lib/takeaway.rb
 => 
#<Takeaway:0x000000014d44ae78
... 
3.0.2 :002 > t.view_menu
Curry House Menu
dal: £6.50
korma: £3.00
rice: £2.50
 => {"dal"=>6.5, "korma"=>3.0, "rice"=>2.5} #not sure how to avoid this line appearing
3.0.2 :003 > t.add_to_order("korma")
 => "1x korma, at £3.00 each, added to your order" 
3.0.2 :004 > t.add_to_order("dal", 3)
 => "3x dal, at £6.50 each, added to your order" 
3.0.2 :005 > t.view_order
Your order contains:
1x korma = £3.00
3x dal = £19.50
Order total = £22.50

 => nil #not sure how to avoid this line appearing
3.0.2 :006 > t.complete_order
 => "Thank you for your order, which totals to £22.50. Your food will arrive by 11:48" 
3.0.2 :007 > exit

katbrooks@Kats-Air takeaway % irb -r ./lib/menu.rb
3.0.2 :001 > m = Menu.new
 => #<Menu:0x00000001351f0d70 @dishes={"dal"=>6.5, "korma"=>3.0, "rice"=>2.5}> 
3.0.2 :002 > m.add_dish("chapati", 1.50)
 => 1.5 
3.0.2 :003 > m.dishes
 => {"dal"=>6.5, "korma"=>3.0, "rice"=>2.5, "chapati"=>1.5} 
3.0.2 :004 > m.display
Curry House Menu
dal: £6.50
korma: £3.00
rice: £2.50
chapati: £1.50
 => {"dal"=>6.5, "korma"=>3.0, "rice"=>2.5, "chapati"=>1.5} 
 ``` 

### Problems/questions
==================
1) My main concerns were around testing. Not sure if I'm using test doubles correctly and therefore if I've got sufficient test coverage. (nb: when I run rspec, it shows 100% coverage, but when I run rspec on individual spec folders, it shows <100% coverage.)

2) Is there a way to test if one class' method creates a new instance of another class? Not sure how to test this is happening correctly (e.g. testing that Takeaway's complete_order method creates Message.new)

2) Is it good practice, or just unecessary, to have a file like my takeaway.rb which simply calls on other classes' methods, acting as a customer interface?

2) Should I be using dependency injection to inject instance of Dish class into Menu via the add_dish method. If so, not sure how because Dish requires 2 arguments name and price, so how would I account for this when injecting into Menu's add_dish method? 

3) I have called Message.new within the Takeaway complete_order method. Is this fine, or do I need to pass it as an argument (dependency injection?!)

2) When i try to run the message file, I get loaderror message. I get this message with both require 'twilio-ruby' and require 'dotenv' depending on which appears first in the code. However it seems run ok when loaded in irb

 ``` 
 [Running] ruby "/Users/katbrooks/Projects/takeaway/lib/message.rb"
<internal:/Users/katbrooks/.rvm/rubies/ruby-3.0.0/lib/ruby/3.0.0/rubygems/core_ext/kernel_require.rb>:85:in `require': cannot load such file -- twilio-ruby (LoadError)
	from <internal:/Users/katbrooks/.rvm/rubies/ruby-3.0.0/lib/ruby/3.0.0/rubygems/core_ext/kernel_require.rb>:85:in `require'
	from /Users/katbrooks/Projects/takeaway/lib/message.rb:2:in `<main>'
 ```

