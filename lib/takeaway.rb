require_relative './order'

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
    raise "There is no current order" if @current_order.nil?
    @current_order.bill
  end

  def add_to_order(dish)
    raise "There is no current order" if @current_order.nil?
    @current_order.add(dish)
  end
end
