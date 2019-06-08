require_relative 'menu'
require_relative 'order'
require_relative 'messager'

class Restaurant
  attr_reader :name

  def initialize(name, menu = Menu.new, order_class = Order, messager = Messager.new)
    @order_class = order_class
    @name = name
    @menu = menu
    @messager = messager
  end

  def add_menu_item(name, price)
    @menu.add_item(name, price)
  end

  def view_menu
    @menu.print_menu
  end

  def create_new_order
    @order = @order_class.new
  end

  def add_to_order(item, qty)
    @order.add_item(get(item), qty)
  end

  def view_order
    @order.print_order
  end

  def verify_total
    @order.total
  end

  def send_order
    @messager.send
    'Order sent'
  end

  private

  def get(item)
    @menu.get(item)
  end

end
