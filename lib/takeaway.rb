require_relative 'menu'
require_relative 'order'
require_relative 'messenger'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  # show menu
  # add to order(dish_name, quantity = 1)
  # show order
  # confirm order
  # send confirmation
  # receive order

end