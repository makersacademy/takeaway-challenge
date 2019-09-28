class OrderList

  attr_reader :order_list

  def initialize
    @order_list = []
  end

  def add_to_order(item, quantity)
    order_list << { item => quantity }
  end

end
