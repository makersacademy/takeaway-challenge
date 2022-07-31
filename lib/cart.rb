require_relative "menu.rb"

class Cart
    
    attr_reader :in_cart 

    def initialize
        @in_cart = []
    end

    def add_to_cart(number)
        fail "Dish doesnt exist try another one" if number > @menu_count
    end 

end