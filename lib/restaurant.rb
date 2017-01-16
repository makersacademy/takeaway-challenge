require_relative 'menu'
require_relative 'order'
require_relative 'text_message'
require_relative 'client_details'

class Restaurant
    
    include ClientDetails
    
    def initialize(menu: Menu.new, order: Order.new, text_message: TextMessage.new(client_details))
        @menu = menu
        @order = order
        @text_message = text_message
    end
    
    def show_menu
        menu.print_dishes
    end
    
    def take_order(user_order)
        order.add(user_order)
        text_message.send
        order.total
    end
    
    private
    
    attr_reader :menu, :order, :text_message
end