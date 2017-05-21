require 'menu'
require 'order'
class Restaurant

	 
  def initialize(menu:, order: nil)
  	 @menu = menu
  	 @order = order || Order.new
 	end

  def print_menu
  	 menu.print 
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
    order.total
  end

private

attr_reader :menu, :order

end

# p r= Restaurant.new
# p r.menu
# p r.basket
