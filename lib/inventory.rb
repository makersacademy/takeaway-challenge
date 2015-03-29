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

  def add_to_cart(selected_dish, selected_quantity)
    if selected_quantity <= @dishes_list[selected_dish]
    @shopping_basket[selected_dish] = selected_quantity
    value = @dishes_list[selected_dish] - @shopping_basket[selected_dish]
    @dishes_list[selected_dish] = value
    else
      # fail to be written
    end
  end
end
