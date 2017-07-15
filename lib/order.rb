require_relative 'takeaway'

class Order
  attr_reader :basket

    def initialize
      @basket = []
      @total = 0
    end

    def add(item, quantity = 1, price)
      store_ordered_items(item, quantity, price)
      return "#{quantity} x #{item}, costing £#{quantity * price} have been added to your order"
    end

    def total
      @basket.each do |hash|
        @total += hash[:price]
      end
      return "Total of £#{@total}"
    end

private
    def store_ordered_items(item, quantity, price)
      @basket << { :dish => item, :quantity => quantity, :price => price }
    end

end
