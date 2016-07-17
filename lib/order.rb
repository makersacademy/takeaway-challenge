require_relative 'menu'

class Order
  attr_reader :basket, :menu

  def initialize(basket = {}, menu = Menu.new)
    @basket = basket
    @menu = menu
  end

  def add_dish(dish, quantity)
    fail "That dish is not on the menu" if !@menu.dishes.key?(dish)
    @basket.store(dish, quantity)
  end

end
