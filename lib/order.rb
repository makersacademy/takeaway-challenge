class Order

  attr_reader :dishes, :menu

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, amount)
    fail "#{dish.capitalize} is not on the menu" unless menu.has_dish?(dish)
    dishes[dish] = amount
  end
end
