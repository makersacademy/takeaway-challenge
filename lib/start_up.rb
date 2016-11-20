require './lib/takeaway.rb'


def start
menu = Menu.new
takeaway = Takeaway.new
takeaway.add_menu_items(menu)
order = Order.new
end
