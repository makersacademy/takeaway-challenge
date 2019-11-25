class Order
  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_item(item)
    @current_order << item
  end

  def remove_item(item)
    @current_order.delete(item)
  end

  def print_order
    print @current_order
  end
end
