class Order

    attr_reader :order_list, :menu

    def initialize
        @order_list = {}
    end

    def basket
        order_list
    end

    def add(item, quantity)
        order_list.has_key?(item) ? order_list[item]  = order_list[item] + quantity  : order_list[item] = quantity
    end

    def total_amount(menu)
        total = 0
        @order_list.each {|k, v| total = total + (v * menu.restaurant_menu[k])}
        total
    end
end