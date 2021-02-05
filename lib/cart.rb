class Cart
  def initialize
    @order = []
  end

  def receive_item(item)
    @order.push(item)
  end
end
