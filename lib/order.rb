class Order
  attr_accessor :order

  def initialize
    @order = []
  end

  def add_to_order(dish, quantity)
    i = 1
    while i <= quantity do
      @order.push(dish)
      i += 1
    end
    return @order
  end
end