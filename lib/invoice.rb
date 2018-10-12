class Invoice

  def initialize(order)
    @order = order
    @total_price = 0
  end

  attr_reader :total_price, :order

  def total
    @order.each do |ordered_item|
      ordered_item.each do |item, price|
        @total_price += price
      end
    end
    @total_price
  end

end
