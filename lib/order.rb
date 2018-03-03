class Order
  attr_reader :current_order
  # todo/edge cases
  # 1. accumulate orders
  # 2. delete 1 order instead of who

  def initialize
    @current_order = []
  end

  def add_item(item)
    @current_order << item
  end

  def remove_item(item)
    raise 'Order is already empty' if @current_order.empty?
    @current_order.delete(item)
  end

  def confirm_order
    raise 'Unable to confirm an empty order' if @current_order.empty?
    @current_order
  end

  def clear_order
    @current_order.clear
  end
end
