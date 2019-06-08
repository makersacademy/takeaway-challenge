require_relative 'menu'

class Restaurant
  attr_reader :name

  def initialize(name, menu = Menu.new, order_class = Order)
    @order_class = order_class
    @order = []
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

end
