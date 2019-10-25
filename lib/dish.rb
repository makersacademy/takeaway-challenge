class Dish
    attr_reader :menu
    def initialize
        @menu
    end

    def menu
        menu = ["Pizza", 10, "Curry", 5, "Pie", 4, "Chips", 2, "Salad", 2]
        @menu = menu
        
    end
end

