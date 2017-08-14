require './docs/menu.rb'
require './docs/takeaway.rb'
require './docs/phone.rb'

takeaway = Takeaway.new

takeaway.header

takeaway.choose_dish(3, 2)
takeaway.choose_dish(5, 3)
takeaway.choose_dish(6, 4)

takeaway.show_basket
