require './lib/place_order'
require './lib/menu'
my_menu = Menu.new

takeaway = PlaceOrder.new

# my_menu.print_menu
# takeaway.ask_for_order
 takeaway.take_order
 takeaway.calculate_total
# takeaway.ask_for_total
# takeaway.take_user_total
# takeaway.total_agreed?
# takeaway.confirm_order
# takeaway.take_number
