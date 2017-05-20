require_relative 'menu'
require_relative 'order'

class TakeAway
  attr_reader :basket, :menu

  def initialize
    @menu = Menu.new
    @basket = Order.new
  end

  def show_menu
    @menu.dishes
  end

  def add_to_order(dish, amount = 1)
    @basket.add(dish.to_sym, amount)
  end
end
