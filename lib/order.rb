class Order

  attr_reader :dishes, :menu

  def initialize(menu)
    @dishes = Hash.new(0)
    @menu = menu
  end

  def add(dish, quantity)
    fail "That isn't on the menu!" unless menu.has_dish?(dish)
    dishes[dish] += quantity
  end
end
