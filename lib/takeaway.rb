require 'menu'
require 'order'

class Takeaway

  OUT_OF_STOCK = ''

  def initialize(menu = Menu.new, order_class = Order)
    @menu = menu
    @order_class = order_class
    @current_order = @order_class.new
  end

  def add_to_order(choice)
    item = @menu.dishes.select { |existing| choice == existing[:dish] }.first
    raise OUT_OF_STOCK if item[:available].zero?

    @current_order.add_item(item)
  end

  def view_order
    @current_order.items_ordered.map { |order_item| order_item[:dish].name }
  end
end
