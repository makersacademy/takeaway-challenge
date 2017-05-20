class Menu

  def list_of_dishes
    list_of_dishes = { chicken: 4.99, fish: 5.50, beef: 4.99, vegetarian: 4.50}
  end

  def selection_of_dish(dish)
    raise "Dish not in menu: please select a dish from the menu" unless list_of_dishes.has_key?(dish)
  end
end
