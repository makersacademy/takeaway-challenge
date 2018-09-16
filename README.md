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

This repository contains the week 2 Makers Academy homework challenge. The program is run on the command line and allows you to see everything on a takeaway menu, place orders from that menu and complete the order and have a message confirming your order and a delivery time sent to your phone using Twilio.

The actual requirements for the program were a little thin in that to satisfy them required relatively little writing of code. If I were to continue with this program to bulk it out here are some things I would do:
- Create a menu class so I could add and remove dishes being ordered
- Create methods to require some details like address and phone number before allowing orders to be placed on the system
- Play with the send messages to include further details about the order (total price, whether it was paid for already, where it's going to, delivery drivers name etc.)
- Have a search function in the menu class so people could search for 'chicken' and have it return a list of chicken based dishes

I did manage to be able to get Twilio to respond to texts I sent but wasn't sure how to get it to interact with them, the whole creating a server process is super unfamiliar but something I'd like to come back to.

To use this program you can clone this repo, navigate to it's folder in the command line and require the 'lib/takeaway.rb' in irb. Currently when you run the program it would only send messages to my phone though ¯\_(ツ)_/¯

an example of it's use it irb would be

1. require the takeaway class (automatically requires message class)
2. check what's on the menu using read_menu
3. add a couple of dishes to your order
4. check what's currently in your basket
5. add some more dishes
6. checkout to confirm your order

this looks like:

```
2.5.0 :001 > require './lib/takeaway.rb'
 => true

2.5.0 :002 > order = TakeAway.new
 => #<TakeAway:0x00007fbbf60f9ee8    [A whole load of Twilio stuff is created here]

2.5.0 :003 > order.read_menu
Sweet & Sour Chicken Balls: £3.99
Chicken Chowmein: £4.50
Crispy Shredded Beef: £5.90
Egg Fried Rice: £3.00
Fried Duck with Black Bean Sauce: £6.40
 => {"Sweet & Sour Chicken Balls"=>3.99, "Chicken Chowmein"=>4.5, "Crispy Shredded Beef"=>5.9, "Egg Fried Rice"=>3.0, "Fried Duck with Black Bean Sauce"=>6.4}

2.5.0 :004 > order.add_dish('Egg Fried Rice')
 => 3.0

2.5.0 :005 > order.basket_total
 => "1x Egg Fried Rice = £3.00. Total £3.00"

2.5.0 :006 > order.add_dish('Sweet & Sour Chicken Balls',2)
 => 10.98

2.5.0 :007 > order.add_dish('Chicken Chowmein',3)
 => 24.48

2.5.0 :008 > order.basket_total
 => "1x Egg Fried Rice = £3.00, 2x Sweet & Sour Chicken Balls = £7.98, 3x Chicken Chowmein = £13.50. Total £24.48"

2.5.0 :009 > order.checkout
 => <Twilio.Api.V2010.MessageInstance [A whole load of Twilio stuff is here too]
 ```
