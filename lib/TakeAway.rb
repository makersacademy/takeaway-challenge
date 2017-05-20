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
    raise "Sorry, that item is not on the menu" unless @menu.dishes.has_key?(dish.to_sym)
    @basket.add(dish.to_sym, amount)
  end
end
