class Takeaway
  attr_reader :menu, :order_class, :current_order
  def initialize(menu, order_class)
    @menu = menu
    @order_class = order_class
  end

  def view_menu
    menu.view_items
  end

  def show_total
    return "There isn't an order in process." if current_order.nil?

    @current_order.show_total
  end

  def start_new_order
    @current_order = order_class.new
  end

  def order_item(item)
    item_from_menu = @menu.get_item(item)

    @current_order.add_item(item_from_menu) unless item_from_menu.nil?
  end
end
