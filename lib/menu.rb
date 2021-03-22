class Menu 
    attr_reader :dishes

    def initialize
        @dishes = {
            "Pizza" => 5,
            "Pasta" => 8,
            "Bruschetta" => 3,
            "Burrata" => 4.5,
            "Lasagne" => 10,
            "Gelato" => 2.5,
            "Tiramisu" => 4.99
        }
    end

    def show_menu
        @dishes.map { |key, value| "#{key}, £#{value}"}
    end

    def has_dish?(dish)
        dishes.has_key?(dish) 
    end
end