require 'menu'

class Order
    attr_reader :order

    def initialize
        @menu = Menu.new

        @order = [] 
    end

    def add_item(name, amount)
        @menu.menu_items.each do |dish, price|
            if name == dish
                #add the dish
                @order.push ([name, amount])
                total = amount * price
            raise 'This item is not on the menu' if name != dish
        end
    end

    def total 
        "The total for your order is #{@order}."
        #should create message for twilio here
    end
  end
end