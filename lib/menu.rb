require "food"
require "order"
class Menu
    def initialize(food_class = Food, order_class = Order)
        @food_class = food_class
        @order_class = order_class
        @foods = []
        @current_order = nil
    end
    def add(name, price)
        @foods << @food_class.new(name, price)
    end
    def chinese_restaurant
        self.add("Teriyaki", 8)
        self.add("Chow Mein", 6)
        self.add("Gyoza", 4)
        self.add("Pork Balls", 6)
        self.add("Chilli Beef", 9)
        self.add("Satay Chicken", 5)
        self.add("Prawn Toast", 3)
        self.add("Sweet and Sour Chicken", 8)
        self.add("Ramen", 10)
        self.add("Chicken Wings", 6)
        self.add("Prawn Crackers", 6)
    end

    def show
        @foods.each do |food|
            puts "#{food.name}" + ", £#{food.price}"
        end
    end

    def add_to_order(item)
        if @current_order == nil
            @urrent_order = @order_class.new
        end
        @foods.each do |food|
            if food.name == item
                @current_order.add_to_basket(food)
            end
        end
    end
end
menu = Menu.new
menu.chinese_restaurant
menu.show