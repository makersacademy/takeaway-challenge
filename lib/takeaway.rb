require_relative './order'
require_relative './text'

class Takeaway
  def initialize(menu = Menu.new, order_class = Order)
    @menu = menu
    @order_class = order_class
    @current_order = nil
  end

  def show_menu
    @menu.list_items
  end

  def start_new_order
    @current_order = @order_class.new
  end

  def check_bill
    no_order?
    @current_order.bill
  end

  def add_to_order(dish)
    no_order?
    @current_order.add(dish)
  end

  def place_order
    no_order?
    raise "The current order is empty" if @current_order.total.zero?
    @current_order = nil
    text
  end

  private

  def no_order?
    raise "There is no current order" if @current_order.nil?
  end
end
