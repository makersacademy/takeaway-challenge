Takeaway Challenge
==================
<a href= #task>TASK</a>  |  <a href= #edge>EDGE CASES</a>  |  <a href= #approach>APPROACH </a> | <a href= #tests>TESTS</a>
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
[Task](#task)
-----

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

[Edge Cases / Extra features](#edge)

  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * Mocks and/or stubs to test texts without sending in rspec.
  * IRB actually sends texts.(within UK)
  * Environment variables to protect actual phone number.

* (Not yet:
  * Implement the ability to place orders via text message.)


[Feature Tests](#tests)

Initialize with array of food to go on menu. This initializes all the other key components.
```
2.5.0 :001 > require './lib/menu.rb'
 => true
2.5.0 :002 > menu = Menu.new(["fish", "pasta", "pizza"])
 => #<Menu:0x00007fb4a4167780 @names=["fish", "pasta", "pizza"], @item=Item, @items=[#<Item:0x00007fb4a4167730 @name="fish", @calculator=#<Calculator:0x00007fb4a4167708 @price_list={"fish"=>8, "pizza"=>5, "pasta"=>6, "cake"=>3}>, @price=8>, #<Item:0x00007fb4a4167690 @name="pasta", @calculator=#<Calculator:0x00007fb4a4167668 @price_list={"fish"=>8, "pizza"=>5, "pasta"=>6, "cake"=>3}>, @price=6>, #<Item:0x00007fb4a41675f0 @name="pizza", @calculator=#<Calculator:0x00007fb4a41675c8 @price_list={"fish"=>8, "pizza"=>5, "pasta"=>6, "cake"=>3}>, @price=5>], @formatter=#<Formatter:0x00007fb4a4167550>, @order=#<Order:0x00007fb4a4167528 @items=[], @order_total=0>, @textmessage=#<TextMessage:0x00007fb4a41674d8 @client=<Twilio::REST::Client @account_sid=ACa8986a01f18546d43b9cfa6a82a57d5f>>>
2.5.0 :003 >menu.print_menu
 => ["fish --- £8\n", "pasta --- £6\n", "pizza --- £5\n"]
```
user_input allows interaction with stdin for choice, volume and loops if not all. NB while the methods adding this to the order are tested, the user input itself isn't currently.s
```
2.5.0 :006 > menu.user_input
Please select your option
Pizza
How many Pizzas would you like?
2
Is that all?
Yes
 => nil
```
Return the total price with:  
```
2.5.0 :007 > menu.return_order_total
 => 10
```

confirm_order recalculates price and raises error if ther e is a mistake. Otherwise a confirmation text is sent.

```
2.5.0 :009 > menu.confirm_order
SM3eded974666a4cb49d4cb5392a09ae34
 => nil
2.5.0 :010 > exit
```

Outstanding
- test user input method with stubbed responses
- format return_total_price
- test text messages outside IRB
- add further functionality eg place order by text
- restructure so menu calls directly to a single calculator and formatter rather than running through each item
