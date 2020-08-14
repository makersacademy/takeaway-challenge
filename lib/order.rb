class Order
  attr_reader :order
  def initialize
    @order = []
  end

  def add(item, price, quantity)
    @order.push({item: item, price: price, quantity: quantity})
  end

  def total
  
  end
end
