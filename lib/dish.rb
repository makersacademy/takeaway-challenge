class Dish
    attr_reader :menu, :selection, :order
    def initialize
        @menu
        @order =[]
    end

    def menu
        menu = {"Pizza" => 10, "Curry" => 5, "Pie" => 4, "Chips" => 2, "Salad" => 2}
        @menu = menu
        
    end

    def selection(dish, price)
        @order = order
        @order << selection
    end
end

