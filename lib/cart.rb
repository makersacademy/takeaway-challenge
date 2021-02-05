class Cart
  attr_reader :order
  def initialize
    @order = []
  end

  def receive_item(item)
    @order.push(item)
  end

  def calculate_total
    @order.map { |item| item.price }.sum
  end
end
