class Order
  attr_reader :order
  def initialize
    @order = []
  end

  def add(item, quantity, price)
    @order.push({item: item, quantity: quantity, price: price})
  end

  def total
    total = 0
    @order.each do |hash|
      total += (hash[:price] * hash[:quantity])
    end
    # enu.find { |el|  el % 2 == 0 && el % 9 == 0}
    total
  end
end
