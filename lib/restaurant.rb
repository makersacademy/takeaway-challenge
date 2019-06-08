require_relative 'menu'
require_relative 'order'

class Restaurant
  attr_reader :name

  def initialize(name, menu = Menu.new, order_class = Order)
    @order_class = order_class
    @name = name
    @menu = menu
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

  private

  def get(item)
    @menu.get(item)
  end

end
