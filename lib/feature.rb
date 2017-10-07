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
basket.add_item(list.dish_list[0],3)
basket.add_item(list.dish_list[8],2)
basket.add_item(list.dish_list[13])
basket.add_item(list.dish_list[4])
basket.add_item(list.dish_list[4],-3)
# list.select_item(1,3)
# list.select_item(9)
# list.select_item(9,2)
# list.select_item(5)
# list.select_item(12) # out of index handling
# list.select_item(5, -5) # negative quantity
# list.select_item(18, -6) # negative quantity and out of index
basket.remove_item(list.dish_list[0])

puts basket.create_receipt

basket.remove_item(list.dish_list[0])
basket.remove_item(list.dish_list[4], 6)
basket.remove_item(list.dish_list[17])
basket.remove_item(list.dish_list[9], 9)
puts
puts basket.create_receipt
order = Order.new(basket)
puts order
# order.finalise_order

