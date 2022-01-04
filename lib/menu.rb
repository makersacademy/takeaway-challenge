class Menu

    DEFAULT_DISHES = {
        "1/2 Chicken": 7.95,
        "1/4 Chicken": 4.25,
        "Chicken Burger": 5,
        "Chips": 2.50,
        "Soft Drink": 1.50
    }

    attr_reader :dishes

    def initialize(dishes = DEFAULT_DISHES)
        @dishes = dishes
    end

    def list
        @dishes.each do |(key, value)|
            puts "#{key} £#{value}"
        end
    end

   
end