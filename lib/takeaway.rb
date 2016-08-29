#Understands the process of ordering a takeawy

require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def get_menu
    @menu.print_menu
  end

  def select_food(food, amount)
    fail "This item is not on the menu" if @menu.included?(food) == false
    @basket[food] = amount
  end

  def order_total
    @basket
  end

end
