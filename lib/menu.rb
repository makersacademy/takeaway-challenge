require './lib/order.rb'
class Menu

attr_reader :menu

    def initialize
        @menu = {}
        menu[:hawaiian_pizza] = 7
        menu[:meat_feast] = 9
        menu[:spicy_chicken_pizza] = 8
        menu[:chicken_wings] = 3
        menu[:ham_pineapple_pizza] = 9.5
        menu[:cheese_pizza] = 7.5
        menu[:anchovy_pizza] = 8
        menu[:duck_pizza] = 10.5
        menu[:vegetarian_pizza] = 6
    end

    def menu_list
      menu
    end

    def delete_dish(menu_item)
      menu.delete_if {|k ,v| k == menu_item}
    end

    def add_dish(menu_item, price)
      menu[menu_item] = price
    end


end
