class Menu 
    attr_reader :menu_name, :menu_price

def initialize
    @menu_price =
    {
        1 => 3.00, 
        2 => 6.00,
        3 => 8.00,
        4 => 4.00,
        5 => 5.00
    }

    @menu_name = 
    {
        1 => "Egg Fried Rice", 
        2 => "Fish and Chips",
        3 => "Cheese Pizza",
        4 => "Spicy Wings",
        5 => "Lamb Curry"
    }
end

    def display
        @menu_price.each do |key, value|
            price = @menu_price[key]
            name = @menu_name[key]
            puts "#{key} - #{name}: #{price}"
        end
    end

    def get_price(dish_id)
        @menu_price[dish_id]
    end

    def price_exist(dish_id)
        @menu_price.has_key?(dish_id)
    end
end