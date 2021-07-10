
class Order
    
    attr_reader :order_number, :order_list 

    def initialize(order_number)
        @order_number = order_number
        @order_list = []
    end


end