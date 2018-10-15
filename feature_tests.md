User story 1
require './lib/menu'
menu = Menu.new
menu.list_dishes

User Story 2
require './lib/menu'
menu = Menu.new
menu.select_dish(dish)
menu.order

User Story 3
require './lib/menu'
menu = Menu.new
menu.select("pizza")
menu.select("burger")
menu.total
