require_relative 'menu'
require_relative 'takeaway'

class Order

  attr_reader :dishes, :menu

  def initialize
    @dishes = {}
    @total = 0
    @menu = Menu::MENU
  end

  def add_order(dish, quantity)
    fail "#{dish.capitalize} is not on the menu!" unless dish?(dish)
    dishes[dish] = quantity
    quantity.times { @total += @menu[dish] }
  end

  def order_total
    return "£#{@total}"
  end

  private
  def dish?(dish)
    @menu[dish]
  end

end
