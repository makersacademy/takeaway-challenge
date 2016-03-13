require_relative 'menu'
require_relative 'order'

class Counter

  def initialize(menu = Menu.new, order_class = Order, sms = Sms)
    @menu = menu
    @order_class = order_class
    @sms = Sms
  end

  def show_menu
    @menu.show
  end

  def add_dish(name, price)
    @menu.add(name, price)
  end

  def new_order
    @current_order = @order_class.new @menu
  end

  def add_item(name, quantity)
    @current_order.add_item(name, quantity)
  end

  def show_order
    @current_order
  end

  def show_total
    @current_order.total
  end

  def complete_order
    @sms.new
  end
end
