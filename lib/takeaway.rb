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
          order.add(dish, amount)
        }
        order.total
    end

    private

    attr_reader :menu, :order
end