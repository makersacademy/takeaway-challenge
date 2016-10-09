require_relative "dish"
require_relative "order"
require_relative "menu"

class Takeaway
  #every dish should have a price and a name
  #takeaway should calculate the price to charge
  #menu should contain the dishes available
  #order should store temporary dishes

  attr_reader :order, :total, :menu

  def initialize(order = Order.new, menu = Menu.new )
    @order = order
    @menu = menu
    @total = 0
  end

  def add(dish)
    order.add(dish)
  end

  def remove(dish)
  end

end
