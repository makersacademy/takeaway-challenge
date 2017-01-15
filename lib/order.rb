require_relative 'dish_to_string'

class Order
    
    include DishToString
    
    attr_reader :current_order
    
    def initialize(menu = Menu.new)
        @current_order = {}
        @menu = menu
    end
    
    def add(user_order)
        orders = user_order.split(', ')
        orders.each do |order|
            order_hash = order_to_hash(order)
            error_msg = "#{dish_to_string(order_hash[:dish])} is not on the menu"
            raise error_msg unless menu.on_menu?(order_hash[:dish])
            current_order[order_hash[:dish]] = order_hash[:quantity]
        end
    end
    
    def total
        "Your order total is: £#{add_total.to_s.gsub(/\d{2}\z/) { |m| '.' + m }}"
    end
    
    #private
    
    attr_reader :menu
    
    def add_total
        current_order.map do |dish, quantity|
            menu.dishes[dish] * quantity
        end.inject(:+)
    end
    
    def order_to_hash(order)
        order_hash = {}
        order.scan(/(.+)(\s)(\d+)/) do |dish, space, quantity|
            dish = dish.downcase.gsub(' ', '_').to_sym
            order_hash[:dish] = dish 
            order_hash[:quantity] = quantity.to_i
        end
        order_hash
    end
end