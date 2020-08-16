require_relative 'menu'
require_relative 'order'

class Takeaway
    attr_reader :menu, :order
    
    def initialize(menu= Menu.new)
        @menu = menu
    end

    def pick
        @menu.view
        new_order
        #if it comes to it ask user for input
        # array.push({:Burger => 5.00})
    end

    def new_order
        @order = Order.new
    end
end
