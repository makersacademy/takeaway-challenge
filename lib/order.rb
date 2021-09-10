class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def add_item(item)
    @order.push(item)
  end 

end 