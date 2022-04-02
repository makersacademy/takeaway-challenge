require_relative 'dish'
require_relative 'menu'

class Order

    attr_accessor :order

    def initialize(menu, *item_number)
        @order = []
        @item_numbers = [*item_number]
        @menu = menu
        @total_price = 0
    end

    def submit_order
        @order = @item_numbers.map { |dish| @menu.menu[dish-1]}
    end

    def check_order_price
        calculate_order_price.each { |amount| @total_price+=amount}
        @total_price
    end

    private 
    def calculate_order_price
        @order.map {|dish| dish.instance_variable_get(:@price)}
    end
end