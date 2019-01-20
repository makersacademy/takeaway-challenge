require_relative 'pizza'
require_relative 'order'
require_relative 'confirmation'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu_class = Pizza.new, order_class = Order.new, confirmation_class = Confirmation.new)
    @menu = menu_class
    @order = order_class
    @confirm = confirmation_class
  end

  def view_menu
    @menu.view_food_and_price
  end

  def place_order(item, quantity)
    @order.add_to_order(item, quantity)
  end

  def new_order
    @order = create_order
  end

  def price
    @order.total_price
  end

  private

  def create_order
    @order = Order.new
  end

end
