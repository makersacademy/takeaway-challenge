class Inventory
  attr_reader :dishes_list, :shopping_basket
  def initialize
    @dishes_list = {}
    @shopping_basket = {}
  end

  def make_list(dish_name, dish_quantity)
    fail "#{dish_name} is not available anymore" if dish_quantity <= 0
    @dishes_list[dish_name] = dish_quantity
  end
end
