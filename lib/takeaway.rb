require_relative 'menu.rb'
require_relative 'order.rb'

class Takeaway
    attr_reader :menu, :order

    def initialize(menu = Menu.new)
        @menu = menu
        @order = nil
    end
    
    def read_menu
        menu.printed_menu
    end

    def add_to_order(item, quantity)
        fail 'Sorry, this item is not on the menu.' unless menu.restaurant_menu.include?(item)
        @order = Order.new if order_started? == false 
        @order.add(item, quantity)
        puts "#{item} x#{quantity} added to your order"
    end

    def order_started?
        @order != nil
    end

    def correct_amount?
        items_prices_total = 0
        @order.order_summary {|k, v| items_prices_total = items_prices_total + (menu.price(k) * v)}
        @order.total_amount == items_prices_total
    end

    def complete_order
        correct_amount?
        puts "Total amount: £#{order.total_amount}"
    end
end