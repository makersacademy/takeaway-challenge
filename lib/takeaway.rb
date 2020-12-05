require './lib/order'

class Takeaway
  attr_reader :menu
  
  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end
  
  def print_menu
    menu.show
  end

  def place_order(dishes)
    dishes.each { |dish, quantity| @order.add(dish, quantity) }
  end
end
