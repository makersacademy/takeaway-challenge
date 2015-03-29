class Inventory
  attr_reader :dishes_list, :shopping_basket
  def initialize
    @dishes_list = {}
    @shopping_basket = {}
    @unavailable = []
  end

  def make_list(dish_name, dish_quantity)
    fail "#{dish_name} is not available anymore" if dish_quantity <= 0
    @dishes_list[dish_name] = dish_quantity
  end

  def add_to_cart(dish_a, quantity_a)
    if quantity_a <= @dishes_list[dish_a]
      @shopping_basket[dish_a] = quantity_a
      @dishes_list[dish_a] -= @shopping_basket[dish_a]
    else
      # fail to be written
    end
  end

  def unavailable
    @dishes_list.each {|key, value| @unavailable << key if value <= 0 }
    @unavailable
  end

  def remove_from_cart(dish_ab, quantity_ab)
    @shopping_basket[dish_ab] = 0
    @dishes_list[dish_ab] += quantity_ab
  end
end
