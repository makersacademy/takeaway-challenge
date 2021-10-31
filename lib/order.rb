require_relative '../lib/menu'

class Order
  attr_reader :basket, :menu

  def initialize
    # @menu = menu
    @basket = {}
  end

  def add_to_order(dish, quantity)
    @basket[dish] = quantity
  end


end