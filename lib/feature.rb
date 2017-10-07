require_relative './dish_list_parser'
require_relative './dish_list'
require_relative './basket'
parser = DishListParser.new
parser.parse_from_file
# p parser.list
list = DishList.new(parser.list)
p list
puts list.display_menu
list.select_item(1,3)
list.select_item(9)
list.select_item(9,2)
list.select_item(5)
list.select_item(12) # out of index handling
list.select_item(5, -5) # negative quantity
list.select_item(18, -6) # negative quantity and out of index
order = Basket.new(list.selected_dishes)
puts order.create_receipt
