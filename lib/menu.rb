

class Menu
    
    def initialize
        @dishes = []
    end
    
    def dishes
        
        @dishes
        
    end
    
    def add_dish(dish, price)
        @dishes << {:dish => dish, :price => price}
    end
    
end