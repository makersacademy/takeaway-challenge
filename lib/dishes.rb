class Dishes
    attr_reader :dishes_arr
    
    def initialize
        @dishes_arr = {
            "Chips" => 1.00,
            "Burger" => 1.50,
            "Chicken" => 1.50,
            "Kebab" => 3.00
        }
    end

    def show_menu
        @dishes_arr.each { |dish| print dish }
    end
end