class Order

    attr_reader :order_list, :menu

    def initialize
        @order_list = {}
        @menu = Menu.new
    end

    def order_summary
        order_list
    end

    def add(item, quantity)
        order_list.has_key?(item) ? order_list[item]  = order_list[item] + quantity  : order_list[item] = quantity
    end

    def total_amount
        total = 0
        @order_list.each {|k, v| total = total + (v * menu.restaurant_menu[k])}
        total
    end
end