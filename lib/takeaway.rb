require_relative 'menu'
require_relative 'takeaway'
require_relative 'order'

class Takeaway
  attr_reader :menu, :basket

  def initialize(menu, basket = nil)
    @menu = menu
    @basket = basket
  end

  def basket(dishes)
    Order.new
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

  def print_menu
    menu.print
  end

end
