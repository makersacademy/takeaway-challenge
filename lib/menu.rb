class Menu
    RESTAURANT_MENU = [{:name => 'chips', :price => 2}, {:name => 'pizza', :price => 10}]

    attr_reader :restaurant_menu

    def initialize(restaurant_menu=RESTAURANT_MENU)
        @restaurant_menu = restaurant_menu
    end

    def price(item_name)
        restaurant_menu.each {|item| return item[:price] if item[:name] == item_name}
    end

    def printed_menu
        menu = []
        restaurant_menu.each {|item| item.each_value {|v | menu.append(v) }}
        menu
    end
end