class Restaurant
  def initialize(menu = Menu.new, order_klass = Order, sms = Sms.new)
    @menu = menu
    @order_klass = order_klass
    @sms = sms
    @order_log = []
  end

  def read_menu
    @menu.display
  end

  def order(dish, quant = 1)
    dish = dish.to_sym
    new_order
    @current_order.add(dish, quant)
  end

  def remove(dish, quant = 1)
    dish = dish.to_sym
    @current_order.remove(dish, quant)
  end

  def show_order
    @current_order.show_basket
  end

  def order_total
    "Total: £#{@current_order.total}"
  end

  def checkout(money)
    @current_order.complete_order money
    send_message(order_total)
    store_order
  end

  def send_message(total)
    @sms.message(total)
  end

  def order_log
    @order_log.dup
  end

  private

  def new_order
    @current_order ||= @order_klass.new @menu
  end

  def store_order
    @order_log << @current_order
    @current_order = nil
    'Thank you! Your order is being prepared.'
  end
end
