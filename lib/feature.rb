require_relative './dish_list_parser'
require_relative './dish_list'
parser = DishListParser.new
parser.parse_from_file
# p parser.list
list = DishList.new(parser.list)
p list
puts list.display_menu