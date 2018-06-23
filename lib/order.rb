require_relative './menu'
class Order

  attr_reader :basket, :menu

  def initialize(menu)
    @basket = {}
    @menu = menu
  end

  def add(dish, qty)
    raise "#{dish.capitalize} is not available" unless menu.on_menu?(dish)
    basket[dish] = qty
  end

end
