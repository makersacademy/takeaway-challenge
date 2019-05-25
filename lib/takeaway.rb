class Takeaway
  attr_reader :menu, :order_class, :current_order, :sms_sender
  def initialize(menu, order_class, sms_sender)
    @menu = menu
    @order_class = order_class
    @sms_sender = sms_sender
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

  def place_order(price)
    raise 'Amount paid does not equal price of order' if price != show_total

    @sms_sender.confirm_order
  end
end
