class Order
    attr_reader :order_list
    def initialize
        @order_list = []
    end

    def add_item_to_order(item, quantity = 1)
        quantity.times { @order_list << item }
    end
end