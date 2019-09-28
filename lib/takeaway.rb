require 'menu'
require 'order'
require 'messenger'

class Takeaway
  attr_accessor :menu, :order

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