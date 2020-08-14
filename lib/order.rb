class Order
  attr_reader :order
  def initialize
    @order = []
  end

  def add(item, price, quantity)
    @order.push({item: item, price: price, quantity: quantity})
  end

  def total
    total = 0
    @order.each do |hash|
      total += (hash[:price] * hash[:quantity])
    end
    total
  end
end
