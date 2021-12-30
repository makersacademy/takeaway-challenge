class Order
  
  attr_reader :pad, :total

  def initialize
    @pad = []
    @total = 0
  end

  def select(index, menu, quantity)
    @pad << menu[index].merge(amount: quantity)
    @total += menu[index][:cost] * quantity
  end
end
