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

How To Use (IRB) --
-----

2.6.5 :001 > require './lib/order.rb'
 => true 

2.6.5 :002 > order = Order.new
 => #<Order:0x0000000159c53b18

2.6.5 :010 > order.read_menu
£6 fish
£2 chips
£2.5 sausage
£2 mushy_peas

2.6.5 :003 > order.add_item(:fish, 2)
 => 2 
2.6.5 :004 > order.add_item(:chips, 2)
 => 2 
2.6.5 :005 > order.add_item(:mushy_peas, 1)
 => 1 

2.6.5 :006 > order.show_basket
You have fish x 2 in your basket
You have chips x 2 in your basket
You have mushy_peas x 1 in your basket

2.6.5 :007 > order.verify
 => "Your total is £18" 

2.6.5 :008 > order.confirm
Thank you for your order, a text is on its way


Task -- 
-----
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

Process -- 
-----
I started by creating some class diagrams so I could get a feel for the structure of the program that I wanted to build.

This was followed by a TDD driven process by utilising RSpec to write the tests for the classes and methods that I wanted to create, acting and asserting the test example groups to build a working program from red, green to eventually re-factored.

Challenges -- 
-----
I found this project rather challenging. When it came to calculating the price I had trouble working out which way to do it. I decided to make a price method for my menu which would return an integer which I could times the quantity by in the basket. This was a much simpler solution than what I was trying to do before.

I also had trouble getting to grips with the Twilio API as I didn't realise I could not use my own phone number to send the text.

I was unable to find a way to write a test for the send_sms message as I did not know how to mock an API response.

Criteria Met -- 
-----
97.7% test coverage
0 offenses on Rubocop
All user stories met
A working send_sms message
Hidden details using environment variables

