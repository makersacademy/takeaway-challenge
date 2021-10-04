class Takeaway

  attr_reader :order, :menu

  def initialize(order_class = Order)
    @order = order_class.new
  end

  def start_order
    @order.menu.view_menu
  end

  def add(dish)
    @order.add_item(dish)
  end

  def end_order(send_text_class = SendText)
    @order.end_order
    order_status = send_text_class.new
    order_status.send_text
  end
end
