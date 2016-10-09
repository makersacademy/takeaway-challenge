require_relative 'menu'
require_relative 'order'
require_relative 'messenger'

class Takeaway
  attr_reader :menu, :messenger

  def initialize(menu = Menu.new, messenger)
    @menu = menu
    @messenger = messenger
    @current_order = Order.new
  end

  def view_menu
    @menu.dishes
  end

  def add_to_order(item,quantity)
    order = current_order
    dish = @menu.dishes.select { |k,v| k == item }
    order.add_dish(dish,quantity)
  end

  def view_order
    @current_order.view_basket
  end

  def view_cost
    @current_order.view_cost
  end

  def checkout(number)
    @current_order.full_order
    @messenger.send_text(@current_order.finalize_order_message, number)
    @current_order = nil
  end

  private

  attr_reader :current_order

  def current_order
    @current_order = Order.new unless @current_order
    @current_order
  end

end
