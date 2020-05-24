require './lib/menu.rb'
require './lib/order.rb'

class Takeaway
  attr_reader :dishes, :menu, :order
  def initialize(menu, order)
    @menu = menu
    @order = order
  end

  def visualise_menu
    @menu.show_menu
  end

  def add_to_order(dish, quantity = 1)
    raise "item not available" unless menu.dishes.include?(dish)

    @order.add_dish(dish, quantity)
    "#{dish} X #{quantity} added to your order"
  end
end
