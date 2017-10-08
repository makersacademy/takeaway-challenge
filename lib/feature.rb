require_relative './dish_list_parser'
require_relative './dish_list'
require_relative './basket'
require_relative './order'
parser = DishListParser.new
parser.parse_from_file
# p parser.list
list = DishList.new(parser.list)
p list
puts list
basket = Basket.new
basket.add_item(list.dish_list[0])
basket.add_item(list.dish_list[0], 3)
basket.add_item(list.dish_list[8], 2)
basket.add_item(list.dish_list[13])
basket.add_item(list.dish_list[4])
basket.add_item(list.dish_list[4], -3)
basket.remove_item(list.dish_list[0])
basket.remove_item(list.dish_list[0])
basket.remove_item(list.dish_list[4], 6)
basket.remove_item(list.dish_list[17])
basket.remove_item(list.dish_list[9], 9)
puts
order = Order.new(basket)
puts order
puts order.finalise_order()
