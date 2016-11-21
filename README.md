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

- PizzaShop & SushiShop Class inherit TakeawayShop Class.  
  Therefore they only have their own menu inside their class, they just call TakeawayShop's functions.
- Twilio API to send texts to customers.


###[ How to set Twilio API ]

- First, you'll need to register for it. It’s free. => [Twilio](https://www.twilio.com)
- Get a phone number( first one is free ) for your Twilio API.
- Follow the instruction below;

-------
```sh
2.3.1 :001 > require "./lib/twilio_api.rb"
 => true
2.3.1 :002 > my_twilio = TwilioAPI.new( "account_sid", "auth_token", "twilio_phone_number" )
 => #<TwilioAPI:0x007ffe99339808 @twilio_phone_number="twilio_phone_number", @client=<Twilio::REST::Client @account_sid=account_sid>>
```

###[ Instructions ]

```
========  
\:@ "@ /
 \ @,:/   Pizza takeaway shop
  \",/
   \/
```
```sh
2.3.1 :001 > require './lib/pizza_shop.rb'
 => true

2.3.1 :002 > domino_pizza = PizzaShop.new
 => # <PizzaShop:0x007f8088ad3c60
    # @menu={"Margherita"=>7.0, "BBQ Pizza"=>8.5, "Pepperoni"=>9.0,
    #       "Hawaiian"=>8.5, "Garlic Bread"=>1.95, "Fresh Salada"=>1.5, "Diet Coke"=>1.7}>

2.3.1 :003 > domino_pizza.menu
 => {"Margherita"=>7.0, "BBQ Pizza"=>8.5, "Pepperoni"=>9.0,
     "Hawaiian"=>8.5, "Garlic Bread"=>1.95, "Fresh Salad"=>1.5, "Diet Coke"=>1.7}

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

 2.3.1 :007 > message = domino_pizza.create_message
  => "Thank you! Your order was placed and will be delivered before 22:23"

 2.3.1 :008 > my_twilio.send_text( order.phone_number , message )

DEPRECATED] SMS Resource is deprecated. Please use Messages (https://www.twilio.com/docs/api/rest/message)
=> <Twilio::REST::SMS::Message @path=/2010-04-01/Accounts/....>
# this command will send a text to valid phones on Twilio API with this message below:
# "Sent from your Twilio trial account -
#  Thank you! Your order was placed and will be delivered before 22:23(1hour plus when you ordered)"
```
-------
```
     Sushi takeaway shop
```
```sh
2.3.1 :001 > require './lib/sushi_shop.rb'
 => true

2.3.1 :002 > sushiya = SushiShop.new
 => # <SushiShop:0x007fde948c74e8
    # @menu={"Tuna"=>3.0, "Eel"=>5.0, "Egg"=>1.5, "Salmon"=>3.5,
    #        "Sea weed"=>1.95, "Sake"=>9.5, "Miso soup"=>1.0}>

2.3.1 :003 > sushiya.menu
 => {"Tuna"=>3.0, "Eal"=>5.0, "Egg"=>1.5, "Salmon"=>3.5,
     "Sea weed"=>1.95, "Sake"=>9.5, "Miso soup"=>1.0}

2.3.1 :004 > order = Order.new( "phone number", "Tuna", "Salmon", "Sake", "Miso soup" )
 => # <Order:0x007fde9489ec78 @phone="phone number", @order=["Tuna", "Salmon", "Sake", "Miso soup"]>

2.3.1 :005 > sushiya.take_order( order )
 => 2016-11-20 23:47:01 +0000

2.3.1 :006 > sushiya.confirm_order
"You've orderd 4 items.
----------------------
Tuna  £3.0
Salmon  £3.5
Sake  £9.5
Miso soup  £1.0
 => "[ total: £17.0 ]""

2.3.1 :007 > message = domino_pizza.create_message
=> "Thank you! Your order was placed and will be delivered before 24:47"

2.3.1 :008 > my_twilio.send_text( order.phone_number , message )
DEPRECATED] SMS Resource is deprecated. Please use Messages (https://www.twilio.com/docs/api/rest/message)
=> <Twilio::REST::SMS::Message @path=/2010-04-01/Accounts/....>
# this command will send a text to valid phones on Twilio API with this message below:
# "Sent from your Twilio trial account -
#  Thank you! Your order was placed and will be delivered before 24:47(1hour plus when you ordered)"
```
