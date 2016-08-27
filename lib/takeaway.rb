require_relative 'menu'
require_relative 'basket'

class Takeaway

  def initialize(menu = Menu.new, basket = Basket.new)
    @menu = menu
    @basket = basket
  end

  def read_menu
    menu.show_dishes
  end

  def add(dish)
    fail 'Sorry, that\'s not on the menu' unless menu.dishes[dish]
    basket.add_dish(dish)
  end

  private

  attr_reader :menu, :basket

end
