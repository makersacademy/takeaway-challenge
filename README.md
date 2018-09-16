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

Task
-------

Work on this challenge as conclusion of week 2, to work towards these goals:

* I use a methodical approach to solving problems
* I test-drive my code
* I can work to a specification
* I can write standards-compliant, clean object-oriented code

Instructions
-----

* Fork [this repo](https://github.com/makersacademy/takeaway-challenge)
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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

STATUS
-----

- includes feature_spec.rb
- includes takeaway.rb / takeaway_spec.rb
- includes order.rb / order_spec.rb
- includes menu.rb / menu_spec.rb
- includes menu_item.rb / menu_item_spec.rb
- includes sms_sender.rb / sms_sender_spec.rb (latter is empty)
- uses dotenv to store environment variables

completes user stories 1-4, passes all tests
no rubocop offenses, 100% overall test coverage according to Rspec (but no sms_sender_spec.rb tests) when all tests are live (real SMS send currently xit). with xit test 97.66%.

**Notes**
takeaway.rb includes 'inspect' method:
```
  def inspect
    "Takeaway"
  end
```
Uncomment to make IRB output easier to read.

**TO DO**

- Unit tests for Twilio / SMS order confirmation (sms_sender_spec.rb)
- refactoring (including removing numbers from specs)
- tidy up order.rb methods to ensure single responsibility (formatting should be done somewhere else - maybe in takeaway)
- fix heredoc indentation problem

Notes on use in IRB
------------------
```
2.5.0 :001 > require './lib/order.rb'
 => true
2.5.0 :002 > require './lib/menu.rb'
 => true
2.5.0 :003 > require './lib/menu_item.rb'
 => false
2.5.0 :004 > require './lib/takeaway.rb'
 => true
2.5.0 :005 > ta = Takeaway.new
 => #<Takeaway:0x00007ffe4a01c138 @menu=#<Menu:0x00007ffe49153e30 @items=[#<MenuItem:0x00007ffe49152f08 @name="Pizza", @price=8>, #<MenuItem:0x00007ffe49151a68 @name="Burger", @price=9>, #<MenuItem:0x00007ffe491518b0 @name="Chips", @price=4.5>]>, @order=#<Order:0x00007ffe49151770 @basket={}>>
2.5.0 :006 > ta.read_menu
1. Pizza: £8.00
2. Burger: £9.00
3. Chips: £4.50
 => [#<MenuItem:0x00007ffe49152f08 @name="Pizza", @price=8>, #<MenuItem:0x00007ffe49151a68 @name="Burger", @price=9>, #<MenuItem:0x00007ffe491518b0 @name="Chips", @price=4.5>]
2.5.0 :007 > ta.order_item('Chips', 2)
 => 2
2.5.0 :008 > ta.order_item('Pizza')
 => 1
2.5.0 :009 > ta.order_item('Curry', 2)
RuntimeError (This dish is not on the menu!)
2.5.0 :010 > ta.show_order_basket
Chips: £4.50 x 2
Pizza: £8.00 x 1
 => {#<MenuItem:0x00007ffe491518b0 @name="Chips", @price=4.5>=>2, #<MenuItem:0x00007ffe49152f08 @name="Pizza", @price=8>=>1}
2.5.0 :011 > ta.show_order_subtotals
Chips x 2: £9.00
Pizza x 1: £8.00
 => {#<MenuItem:0x00007ffe491518b0 @name="Chips", @price=4.5>=>2, #<MenuItem:0x00007ffe49152f08 @name="Pizza", @price=8>=>1}
2.5.0 :012 > ta.show_order_total
Total: £17.00
 => nil
2.5.0 :01 > ta.checkout(15)
RuntimeError (Totals do not match!)
2.5.0 :015 > ta.checkout
You will receive a confirmation text shortly.

```

Author
-----
Freya Becker [fbl11](https://github.com/fbl11/)