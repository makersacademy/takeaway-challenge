class Order

    attr_reader :menu, :myorder
    def initialize(menu)
        @menu = menu
        @myorder = {}
    end

    def add_to_order(dish, amount)
        raise "Dish not in menu" if !@menu.exists(dish)
        @myorder[dish] = amount
    end
end
