require_relative 'menu'
require_relative 'order'

class Takeaway

attr_reader :menu, :new_array 

def initialize
    @menu = Menu.new
end

def print_menu
    menu.print_menu
end

def create_order
    @my_order = Order.new
end

end