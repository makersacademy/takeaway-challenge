require_relative 'menu'
require_relative 'order'
require_relative 'dish'
require_relative 'sms'

class Takeaway
  attr_reader :order

  def initialize(restaurant_menu, order = Order)
    @order = order.new(restaurant_menu)
  end

  def print_menu
    @order.menu.print_menu
  end

  def add(dish, quantity)
    @order.add(dish, quantity)
  end

  def total
    @order.total
  end

  def receipt
    @order.receipt
  end
end
