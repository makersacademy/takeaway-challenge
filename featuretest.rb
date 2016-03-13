require './lib/controller'
require './lib/dish'
require './lib/menu'
require './lib/order'
require 'twilio-ruby'

dishes = {
  good_pasta: 5 ,
  decent_pasta: 3 ,
  tesco_pasta: 2 ,
  noodles: 1
}

dish_list = Array.new
dishes.each { |name , price| dish_list << ( Dish.new name , price ) }
menu_ofday = Menu.new dish_list
shop = Controller.new menu_ofday , Order , Twilio::REST::Client

puts shop.welcome
puts shop.list_dishes
puts "\n\n"

shop.add_dish 1 , 1
shop.add_dish 3 , 1

p shop.current_order.total_bill
shop.checkout 70
