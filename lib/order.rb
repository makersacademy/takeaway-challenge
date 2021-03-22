require_relative 'menu'

class Order
    attr_reader :dishes, :order
    
    def initialize
        @order = Hash.new(0)
        @total = 0
        @dishes = Menu.new.dishes
        @time = (Time.now + 1*60*60).strftime("%I:%M%p")
    end

    def add(dish, quantity)
        fail "This order isn't on the menu!" unless dishes.has_key?(dish)
        @order[dish] += quantity
    end

    def show_order 
        @order
    end

    def total
        @order.each do |dish, quantity|
            @total += quantity * (@dishes[dish])
        end
        return @total
    end
    
    def complete
        return "Thank you! Your order has been placed and will be with you by #{@time}"
    end 
end