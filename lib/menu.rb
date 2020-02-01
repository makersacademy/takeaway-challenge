require "order"
class Menu
    def initialize(food_class = Food, order_class = Order)
        @food_class = food_class
        @order_class = order_class
        @foods = []
        @current_order
    end
    def add(name, price)
        @foods << @food_class.new(name, price)
    end
    def show
        @foods.each do |food|
            puts food.name + " £#{food.price}"
        end
    end
    def add_to_order(item)
        if @current_order == nil
            @order_class.new
            @foods.each do |food|
                if food.name == item
                    @current_order.add_to_basket(food)
                end
            end
        end
    end
end