class Order

  attr_reader :dishes, :menu

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, amount)
    fail NoItemError, "#{dish.capitalize} WE DO NOT SELL THIS!!!" unless menu.has_dish?(dish)
    dishes[dish] = amount
  end
end

class NoItemError < StandardError; end