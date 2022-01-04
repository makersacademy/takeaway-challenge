class Order
  attr_reader :dishes, :menu
  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    fail "#{dish.capitalize} is not availabe" unless menu.availabe?(dish)
    dishes[dish] = quantity
  end
end