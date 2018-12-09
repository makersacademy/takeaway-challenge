class Takeaway

attr_reader :menu, :order

    def initialize(menu:, order:)
      @menu = menu
      @order = order
    end

    def print_menu
      menu.print
    end

    def place_order(dishes)
        dishes.each do |dish, quantity|
            order.add(dish, quantity)
        end
    end

end