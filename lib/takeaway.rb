class Takeaway

  def initialize(menu, order_log_class = OrderLog)
    @menu = menu
    @order_log = order_log_class.new menu
  end

  def list(list_type)
    list_type.list
  end

  def add_to_order item, quantity
    order.each {|item| @order_log.add item}
  end

  def remove_from_order item, quantity
    order.each {|item| @order_log.add item}
  end

  def place_order
  end

  private
  attr_reader :menu, :order_log

end
