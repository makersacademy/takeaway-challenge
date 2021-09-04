class Restaurant
  attr_accessor :order
  
  def initialize
    @order = nil
  end

  def receive_order(order)
    @order = order
  end

  def confirm_order
    raise 'Restaurant has not received any orders' if !@order


  end
end
