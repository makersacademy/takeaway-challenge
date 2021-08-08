# TODO
# I would like to see a list of dishes with prices <- yes
# I would like to be able to select some number of several available dishes
# I would like to check that the total I have been given matches the sum of the various dishes in my order
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

require_relative 'menu'
require_relative 'order'

class Takeaway

attr_reader :menu, :new_array, :my_order

def initialize
    @menu = Menu.new
    @my_order = Order.new
end

def print_menu
    menu.print_menu
end

def choose_item
    puts "Please choose an item"
    item = gets.chomp().to_i
    get_item(item)
end

def get_item(item)
    user_selection = menu.menu[item]
    my_order.current_order.append(user_selection)
end

end