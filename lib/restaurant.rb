class Restaurant
  def initialize(menu = Menu.new, order_klass = Order, sms = Sms)
    @menu = menu
    @order_klass = order_klass
    @sms = sms
  end

  def read_menu
    @menu.display
  end

  def order(item, quant = 1)
    new_order
    @current_order.add(item, quant)
  end

  def remove(item, quant = 1)
    @current_order.remove(item, quant)
  end

  def show_order
    @current_order.basket
  end

  def order_total
    @current_order.total
  end

  def complete_order(money)
    @current_order.complete_order money
    send_message
  end

  def send_message
    @sms.new
  end

  private

  def new_order
    @current_order ||= @order_klass.new @menu
  end
end
