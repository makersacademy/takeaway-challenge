require_relative 'menu'
require_relative 'takeaway'

class Order

  attr_reader :dishes, :menu

  def initialize
    @dishes = {}
    @menu = Menu::MENU
  end

  def add_order(dish, quantity)
    fail "#{dish.capitalize} is not on the menu!" unless dish?(dish)
    dishes[dish] = quantity
  end

  private

  def dish?(dish)
    @menu[dish]
  end

end
