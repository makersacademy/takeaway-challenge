require_relative 'pizza'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu_class = Pizza.new, order_class = Order)
    @menu = menu_class
    @order = order_class
  end

  def view_menu
    @menu.view_food_and_price
  end

  def place_order(item)
    create_order.add_to_order(item)
  end

  private

  def create_order
    @order.new
  end

end
