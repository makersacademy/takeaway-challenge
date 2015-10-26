require './lib/menu.rb'
require './lib/order.rb'

class Restaurant

  attr_reader :menu, :order

  def initialize(menu=Menu.new, order=Order.new)
    @menu = menu
    @order = order
  end
end
