require_relative 'menu'
require_relative 'order'
require_relative 'messenger'
require_relative 'item'

class Restaurant
  attr_reader :name

  def initialize(name, messenger = Messenger.new, menu = Menu.new,
     order_class = Order)
    @order_class = order_class
    @name = name
    @menu = menu
    @messenger = messenger
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
    raise 'Please create order first' if !@order

    @order.add_item(get(item), qty)
  end

  def view_order
    @order.print_order
  end

  def verify_total
    @order.total
  end

  def send_order
    @messenger.send_confirmation
    'Order sent'
  end

  private

  def get(item)
    @menu.get(item)
  end

end
