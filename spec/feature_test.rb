require './docs/menu.rb'
require './docs/takeaway.rb'
require './docs/phone.rb'

test = Takeaway.new
# test.show_menu
# test.header
test.choose_dish(1, 2)
test.choose_dish(2, 3)
test.choose_dish(5, 4)

test.show_basket
