class Order
  attr_reader :order
  def initialize
    @order = []
  end

  def add(item, quantity, price)
    @order.push({ item: item, quantity: quantity, price: price })
  end

  def total
    total = 0
    @order.each do |hash|
      total += (hash[:price] * hash[:quantity])
    end
    total
  end
end
