# controller / interface

require_relative 'menu'
require_relative 'order'


class Takeaway

  def initialize
  	@menu = Menu.new
    @order = Order.new(@menu)
  end

  def menu
    @menu.view_menu
  end

  def order(item)
  	@order.add(item)
  end

  def basket
  	@order.view_basket
  end

  def total
  	@order.total
  end

  def checkout
  	@order.checkout
  end

end
