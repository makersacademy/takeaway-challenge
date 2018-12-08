class Menu
    attr_reader :list, :choices
    def initialize 
        @list = [
            {:dish => 'green curry', :price => 5.99},
            {:dish => 'panang', :price => 7.5},
            {:dish => 'veg tempura', :price => 4.5},
            {:dish => 'rice', :price => 2.5}
            ]
        @choices = []
    end

    def select(dish_string)
        @list.each do |details|
            if details[:dish] == dish_string
                return @choices.push(details)
            end
        end
        raise 'dish not found'
    end
end