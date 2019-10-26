require_relative "menu"
class Restaurant

  attr_reader :menu, :order

  def initialize
    @order = []
  end

  def load_menu(menu = Menu.new)
    @menu = menu
  end

  def choose(dish)
    chosen = @menu.dishes.select do |key, value|
      key == dish
    end
    @order << chosen
  end

  def total
    cost = 1.0
    return "Your order will cost #{cost}"
  end

end
