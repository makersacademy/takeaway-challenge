class Menu
    RESTAURANT_MENU = {'chips' => 2, 'pizza'=> 10}

    attr_reader :restaurant_menu

    def initialize(restaurant_menu=RESTAURANT_MENU)
        @restaurant_menu = restaurant_menu
    end

    def price(item_name)
        restaurant_menu.each {|item, price| return price if item == item_name}
    end

    def printed_menu
        restaurant_menu
    end
end