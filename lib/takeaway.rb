require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :basket

  def initialize(menu, basket = nil)
    @basket = basket
  end

  def basket(index)
    order = Order.new
    order.add(index)

  #count with a checkout method
  end

  # def print_menu
  #   menu.view_menu
  # end

end
