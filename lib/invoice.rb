class Invoice

  def initialize(order)
    @order = order
  end

  def total
    @total_price = 0
    @order.each do |ordered_item|
      ordered_item.each do |item, price|
        @total_price += price
      end
    end
    @total_price
  end

end
