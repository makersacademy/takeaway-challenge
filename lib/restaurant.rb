require_relative 'menu'
require_relative 'order'

class Restaurant

    def initialize(menu: Menu.new, order: Order.new)
        @menu = menu
        @order = order
    end
    
    def show_menu
        menu.print_dishes
    end
    
    def take_order(user_order)
        order.add(user_order)
        order.total
    end
    
    private
    
    attr_reader :menu, :order
end