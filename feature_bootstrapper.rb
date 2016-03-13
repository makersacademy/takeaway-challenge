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
@shop = Controller.new menu_ofday , Order , Twilio::REST::Client

puts @shop.welcome
