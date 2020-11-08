require_relative 'menu'

class Takeaway
  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def read_menu
    @menu.dishes
  end

  def order(dish, quantity = 1)
    @basket[dish] = quantity
  end
end
