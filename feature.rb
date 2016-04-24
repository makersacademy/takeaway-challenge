require './lib/takeaway.rb'
require './lib/menu.rb'
require './lib/message.rb'

dishes = {"pizza":4, "burger":2, "fries":1}
menu = Menu.new
p menu.print_dish

tw = TakeAway.new(Menu.new,Message.new)
tw.print_menu
y = menu.present? 'pizza'

p y
tw.place_order('pizza',3)
tw.place_order('burger',3)
tw.place_order('fries',5)
p  tw.basket

p tw.basket_summary

