class Dishes
    attr_reader :dishes_arr
    
    def initialize
        @dishes_arr = [
            { item: 'Chips', price: 1.00 },
            { item: 'Burger', price: 1.50 },
            { item: 'Chicken', price: 1.50 },
            { item: 'Kebab', price: 3.00 }
        ]
    end
end