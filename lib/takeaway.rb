require "order"
require_relative 'menu'

class Takeaway
# attr_reader :menu, :order
  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def display_menu
    @menu.display_menu 
  end

  def place_order(dishes)
    dishes.each { |dish, quantity| order.add(dish, quantity) }
    order.total
  end
#   def order(dish, quantity)
#    @order.to_order(dish, quantity)
#     "#{quantity} #{dish}(s) added to order"
#   end
private 

  attr_reader :menu, :order

end
