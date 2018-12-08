class Menu
    attr_reader :list
    def initialize 
        @list = [
            {:dish => 'green curry', :price => 5.99},
            {:dish => 'rice', :price => 2.5}
            ]
    end

    def select(dish_string)
    end
end