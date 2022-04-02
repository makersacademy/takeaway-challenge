require_relative 'dish'
require_relative 'order'

class Menu

    attr_reader :order, :view_menu
    attr_accessor :menu, :item_number

    def initialize
        @menu = []
    end

    def add_dish(name, price)
        dish = Dish.new(name, price)
        @menu.push(dish)
    end

    def menu
        @menu
    end

    private

    def view_order_numbers
        @order_numbers
    end 

end