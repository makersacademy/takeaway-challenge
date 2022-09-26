class Receipt

    def initialize(order)
        @order= order
        @total_order = []
    end

    def total
        sum = 0
        @order.list.map do |dish|
        sum += dish.price
        end
            @sum = sum
    end

    
    def itemised_receipt
        total_receipt = "Items totalled: "
        @order.list.each do |dish|
           total_receipt += "#{dish.name} " + "£#{dish.price} " + "/"
        end
      total_receipt + " Total amount: £#{@sum}" 
    end
end



