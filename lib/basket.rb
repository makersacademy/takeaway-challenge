class Basket

attr_reader :order
    def initialize(menu = Menu.new)
        @dishes = menu
        @order = []
    end

    def select_dish(dish, quantity = 1)
        items = @dishes.dishes.select { |food, price| food == dish }
        raise "Error, item not found!" if items.empty? 
        quantity.times{ @order << items }
        puts "#{quantity} #{dish}(s) added to basket!"
    end

    def check_total
        @total = @order.flat_map(&:values)
        "Your Total Comes to: £#{@total.sum}."
    end

    def checkout(payment)
       raise "Wrong payment amount!" if payment != @total.sum
       #load 'text.rb'
       print "Thank you, your order has been placed!"
       
    end
end