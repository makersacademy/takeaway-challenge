class Order
  
  attr_reader :pad

  def initialize
    @pad = []
  end

  def select(index, menu, quantity)
    quantity.times { @pad << menu[index] }
  end
end
