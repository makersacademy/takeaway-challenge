require_relative 'menu'
require_relative 'order'

class Takeaway
    attr_reader :menu, order
    
    def initialize(menu= Menu.new)
        @menu = menu
    end

    def pick
        @menu.view
        
    end

    def new_order
        @order = Order.new
    end
end
