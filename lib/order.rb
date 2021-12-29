class Order
  
  attr_reader :pad

  def initialize
    @pad = []
  end

  def select(index, menu)
    @pad << menu[index]
  end
end