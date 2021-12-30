class Order
  
  attr_reader :pad

  def initialize
    @pad = []
  end

  def select(index, menu, quantity)
    @pad << menu[index].merge(amount: quantity)
  end
end
