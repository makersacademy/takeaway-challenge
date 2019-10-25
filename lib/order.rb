class Order
    attr_reader :order_list, :customer
    def initialize
        @order_list = []
    end

    def new_customer(customer)
        @customer = customer
    end

    def add_item_to_order(item, quantity)
        quantity.times { @order_list << item }
    end

    def calculate_total_price
        @order_list.map { |item| item.price}.reduce(:+)
    end
end