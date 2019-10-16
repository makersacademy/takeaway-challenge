require 'menu'

class Order
    attr_reader :order

    def initialize(menu = Menu.new)
        @menu = menu

        @order = [] 
        @total = 0
    end

    def add_item(name, amount)
        @menu.menu_items.each do |dish, price|
            if name == dish
                #add the dish to array
                @order.push ([name, amount])
                @total = amount * price
            end
        end
        raise "This item is not on the menu" if @total == 0
    end

    def total
        @total
    end   
end