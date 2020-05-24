require_relative 'menu'
require_relative 'takeaway'

class Order
  attr_reader :basket, :menu

  def initialize
    @basket = {}
    @order_total = 0
    @menu = Menu.new
  end

  def add_to_order(dish, quantity)
    @basket[dish] = quantity
  end
end
