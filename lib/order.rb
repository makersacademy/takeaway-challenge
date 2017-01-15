class Order
    
    attr_reader :current_order
    
    def initialize(menu = Menu.new)
        @current_order = {}
        @menu = menu
    end
    
    def add(user_order)
        dishes = user_order.split(', ')
        dishes.each do |dish|
            dish_to_hash(dish)
        end
    end
    
    def total
        "Your order total is: £#{add_total.to_s.gsub(/\d{2}\z/) { |m| '.' + m }}"
    end
    
    private
    
    attr_reader :menu
    
    def add_total
        current_order.map do |dish, quantity|
            menu.dishes[dish] * quantity
        end.inject(:+)
    end
    
    def dish_to_hash(dish)
        dish.scan(/(.+)(\s)(\d+)/) do |dish, space, quantity|
            dish = dish.downcase.gsub(' ', '_').to_sym
            current_order[dish] = quantity.to_i
        end
    end
end