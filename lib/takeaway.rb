require_relative 'menu'
require_relative 'basket'

class Takeaway

  attr_reader :menu, :basket

  def initialize(menu = Menu, basket = Basket)
    @menu = menu.new
    @basket = basket.new
  end

  def print_menu
    @menu.print_menu
  end

  def add_to_basket(dish_number)
    @basket.add(@menu.list[dish_number])
  end

end
