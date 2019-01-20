require 'meatdish'
require 'order'

class Menu
    attr_reader :menu_list
    def initialize
        @menu_list = {}
    end

    def view_menu
        @menu_list
    end

    def add_food (item, price)
        @menu_list[item] = price
    end
end
