
class Menu
    attr_reader :menu_list

    def initialize(menu_list = {'shrimp' => 3, 'chicken' => 4.30, 'egg' => 2.10})
        @menu_list = menu_list
    end

    def display
        @menu_list
    end

    def includes_item?(item)
          !!@menu_list[item]
    end

    def add_food (item, price)
        @menu_list[item] = price
    end
end
