class Order

  attr_reader :order

  def initialize(order)
    @order = order
  end

  def confirm_total
    total = 0
    order.each do |item|
      price = item.last.to_f
      total += price
    end
    total
  end
end
