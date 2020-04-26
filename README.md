#### Require OrderMenu Class
2.6.5 :001 > require './lib/order_menu'

#### Instantiate OrderMenu
2.6.5 :002 > order_menu = OrderMenu.new

#### Check menu
2.6.5 :003 > order_menu.print\
Item: Burger | Price: 3\
Item: Pizza | Price: 5\
Item: Kebab | Price: 4

#### Enter selection - Throws error: Wrong item
2.6.5 :004 > order_menu.enter_selection("Diamond Ring", 1)\
RuntimeError (Item not available)

#### Enter selection: 2 x Burgers
2.6.5 :005 > order_menu.enter_selection("Burger", 2)

#### Burgers are £3 each, so total should be £6
2.6.5 :006 > order_menu.total\
 => 6 

#### Add more items
2.6.5 :007 > order_menu.enter_selection("Pizza", 3)\
2.6.5 :008 > order_menu.enter_selection("Kebab", 1)

#### Check basket summary
2.6.5 :009 > order_menu.basket_summary
Burger x 2 = 6\
Pizza x 3 = 15\
Kebab x 1 = 4

#### Total
2.6.5 :010 > order_menu.total\
 => 25 

#### Place order - Throws error: Wrong amount
2.6.5 :011 > order_menu.place_order(20)\
RuntimeError (Incorrect amount)

#### Successfully places order and sends SMS
2.6.5 :012 > order_menu.place_order(25)
 => <Twilio.Api.V2010.MessageInstance account_sid: *** api_version: 2010-04-01\ 
body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 16:48