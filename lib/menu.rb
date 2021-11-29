class Menu
    attr_reader :menu, :food, :price, :menu
    
    def initialize
        @menu = Hash.new
        order_selection = []
        total_price = []
        sum = 0
    end

    def add_food(food, price)
        @menu[food] = price 
    end

    def add_order(food)
        @order_selection << food
        if @menu.include?(food) == false
            raise "the order is not in the meny"
        end
    end

    def total_order
        order_selection.each do |food, price| total_price << price
        end
        total_price.each {|bill| @sum += bill}
        return @sum
    end

    def view_menu
        @menu
    end
end