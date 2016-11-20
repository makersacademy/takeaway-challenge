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

Instructions
-------
```sh
2.3.1 :001 > require './lib/pizza_shop.rb'
 => true

2.3.1 :002 > domino_pizza = PizzaShop.new
 => # <PizzaShop:0x007f8088ad3c60
    # @menu={"Margherita"=>7.0, "BBQ Pizza"=>8.5, "Pepperoni"=>9.0,
    #       "Hawaiian"=>8.5, "Garlic Bread"=>1.95, "Fresh Salada"=>1.5, "Diet Coke"=>1.7}>

2.3.1 :003 > domino_pizza.menu
 => {"Margherita"=>7.0, "BBQ Pizza"=>8.5, "Pepperoni"=>9.0,
     "Hawaiian"=>8.5, "Garlic Bread"=>1.95, "Fresh Salada"=>1.5, "Diet Coke"=>1.7}

2.3.1 :004 > order = Order.new( "phone number", "BBQ Pizza", "Pepperoni", "Diet Coke" )
 => # <Order:0x007f8088aab008 @phone="phone number", @order=["BBQ Pizza", "Pepperoni", "Diet Coke"]>

2.3.1 :005 > domino_pizza.take_order( order )
 => 2016-11-20 21:23:23 +0000

2.3.1 :006 > domino_pizza.confirm_order
"You've orderd 3 items.
----------------------
BBQ Pizza  £8.5
Pepperoni  £9.0
Diet Coke  £1.7
 => "[ total: £19.2 ]""

2.3.1 :007 > domino_pizza.send_text
DEPRECATED] SMS Resource is deprecated. Please use Messages (https://www.twilio.com/docs/api/rest/message)
=> <Twilio::REST::SMS::Message @path=/2010-04-01/Accounts/AC98d4d8428ec27f9c5e9c52ade6acbd57/SMS/Messages/SM77923448bb5b471ca58eb1e2111eed51>
# this command will send a text to valid phones on Twilio API with this message below:
# "Sent from your Twilio trial account -
#  Thank you! Your order was placed and will be delivered before 22:23(1hour plus when you ordered)"
```
