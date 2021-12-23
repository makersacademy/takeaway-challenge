class Order
  
  attr_reader :order_pad

  def initialize
    @order_pad = []
  end

  def select(index, menu)
    @order_pad << menu[index]
  end
end