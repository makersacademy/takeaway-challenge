require_relative 'menu'
require_relative 'basket'

class Takeaway 

  attr_reader :menu, :basket, :order_arr

  def initialize(menu:, basket:)
    @menu = menu
    @basket = basket
    @order_arr = []
  end

  def print_menu
    menu.print
  end

  def print_basket
    basket.print
  end

  def add_to_basket(dish, quantity)
    quantity.times{ @order_arr << dish}
  end

end