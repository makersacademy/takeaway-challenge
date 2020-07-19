require "order"

class Takeaway

    def initialize(menu:, order: nil)
        @menu = menu
        @order = order || Order.new
    end

    def print_list
        menu.print    
    end

    def create_order(dishes)
        dishes.each { |dish, amount|
          @order.add(dish, amount)
        }
    end

    private
    attr_reader :menu
end