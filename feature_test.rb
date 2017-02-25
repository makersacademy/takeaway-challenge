require './lib/takeaway.rb'


takeaway = Takeaway.new

menu.show_menu

menu.select_dishes

menu.show_total

menu.confirm_order
