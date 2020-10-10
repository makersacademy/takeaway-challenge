class Order
  attr_reader :order 

  def initialize
    @order = []
  end

  def add_item(item, quantity)
    @order << { item => quantity }
  end
end
