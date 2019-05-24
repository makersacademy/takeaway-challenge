class Takeaway
  attr_reader :menu, :order_class, :current_order
  def initialize(menu, order_class)
    @menu = menu
    @order_class = order_class
  end

  def view_menu
    menu.view_items
  end

  def order(item)
    @current_order = order_class.new if current_order.nil?

    current_order.add_item(item)
  end

  def show_total
    return "There isn't an order in process." if current_order.nil?

    @current_order.show_total
  end
end
