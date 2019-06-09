Takeaway Challenge
===================
This is my version of the takeaway challenge. My approach is to try to leave the code as open to extension as possible. So you should be able to add functionality without modifying the original code. For more information about this project you can find the original readme in this repo under ORIGINAL_README.md.

**Strategy**

My approach to this challenge was to first model on paper what I thought the domain would look like. I started by taking out nouns and verbs to create my classes and messages. I knew from previous experience that trying to model how the classes were going to interact prior to actual coding was going to help me later on down the line. I wanted to make sure that all interaction with the program happened through one entry point. This way the code is responsible for creating new classes as needed and not the user having to explicitly create and manipulate classes.

**Reflection**

After completing the project I took away a few important tips for going forward.
- Need to think more about how I store data so that later on it can be manipulated easier
- Looking back I could save time by not testing logic for methods that only call other methods. Just need to make sure the other method is called and logic will be tested inside that other methods unit test.
- Could write more tests to tighten up what I'm testing. In one instance a test passed but when tested manually had a different output than what I expected.
- Overall I feel quite proud of what I've put together. I can see how I could improve on it but I also see a program that could be added to without altering the existing code(much) and that was my aim in this challenge. Build something that can is set up for long term growth.

**Possible Features**
- Printing of order should get moved into it's own module or possibly alter the code so that the already existing printer module could be utilised.
- Better testing for edge cases and implementing error raising for those edge cases.
- Better organisation of tests could result less repetition.
- Order history could store all Order instances
- Menu writer/reader could be broken out into separate class so that it could store the menu in a csv file and load back in upon startup.
- Many more!


Instructions
============
- Run `bundle install` to install all gems.
- Run the program in `irb`
- `irb -r ./lib/restaurant.rb`
- You will need to set up the following environment variables in your bash profile.
- TWILIO_ACCOUNT_SID= *Twilio SID goes here
- TWILIO_AUTH_TOKEN= *Twilio Auth Token goes here
- TWILIO_FROM_NUMBER= *Your Twilio number goes here
- TWILIO_TO_NUMBER= *Your own phone number goes here
- For instructions on how to do this click [here](https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html)
- You will also need a free Twilio account which you can get [here](https://www.twilio.com)


Here's a sample use of the project.

In terminal from main folder:

```console
~$ irb -r ./lib/restaurant.rb
2.5.0 :001 > cafe = Restaurant.new('cafe')
 => #<Restaurant:0x00007ff6711d4f10 @order_class=Order, @name="cafe", @menu=#<Menu:0x00007ff6711d4ec0 @item=Item, @items=[]>, @messenger=#<Messenger:0x00007ff6711d4ee8>>
2.5.0 :002 > cafe.add_menu_item('tea', 7)
 => [{"tea"=>#<Item:0x00007ff670c026f0 @name="tea", @price=7>}]
2.5.0 :003 > cafe.add_menu_item('cake', 9)
 => [{"tea"=>#<Item:0x00007ff670c026f0 @name="tea", @price=7>}, {"cake"=>#<Item:0x00007ff672263e08 @name="cake", @price=9>}]
2.5.0 :004 > cafe.view_menu
 => "tea - £7\ncake - £9"
2.5.0 :005 > cafe.create_new_order
 => #<Order:0x00007ff670a1bee0 @order=[]>
2.5.0 :006 > cafe.add_to_order('tea', 3)
 => "added 3 tea(s)"
2.5.0 :007 > cafe.add_to_order('cake', 19)
 => "added 19 cake(s)"
2.5.0 :008 > cafe.view_order
 => "3 - tea(s)\n19 - cake(s)"
2.5.0 :009 > cafe.verify_total
 => "Your total is £192"
2.5.0 :010 > cafe.send_order
 => "Order sent"
```

After that you would receive a sms message confirming the order was placed with a timestamp.
