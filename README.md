*Takeaway Challenge*
Elizabeth Venner

* I started but did not complete the third user story. I planned to make a calculate_total private method which would then be called in show_basket

* For the fourth user story, I had decided to use a separate 'Message' class in which I would write the code for sending the text, then simply call this in the confirm_order method of the Order class.


***How to use***

2.3.1 :001 > require './lib/menu'
 => true
2.3.1 :002 > menu = Menu.new('./lib/menu.csv')
 => #<Menu:0x007fe2730b7d10 @dishes={"pasta"=>10, "pizza"=>9, "salad"=>4, "chips"=>3, "icecream"=>4}>
2.3.1 :003 > menu.read_menu
{"pasta"=>10, "pizza"=>9, "salad"=>4, "chips"=>3, "icecream"=>4}
 => nil
2.3.1 :004 > require './lib/order'
 => true
2.3.1 :005 > order = Order.new('./lib/menu.csv')
 => #<Order:0x007fe272998f70 @menu=#<Menu:0x007fe272998f48 @dishes={"pasta"=>10, "pizza"=>9, "salad"=>4, "chips"=>3, "icecream"=>4}>, @basket=[], @basket_summary=[]>
2.3.1 :006 > order.add_item('pasta', 2)
 => "2 x pasta added to your basket"
2.3.1 :007 > order.show_basket
 => "2 x pasta = £20.00,"
2.3.1 :008 > order.confirm_order
