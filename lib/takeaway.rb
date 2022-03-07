class Takeaway

  attr_accessor :total, :order

  def initialize(order = Order.new)
    @order = order
  end

  def check_order_price(price)
    update_total
    price == @total
  end

  private

  def update_total
    @total = @order.finalise
  end

end

puts ENV['ACCOUNT_SID']