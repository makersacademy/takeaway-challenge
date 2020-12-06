require 'dish'

class Menu
  def dish_list
    [
      Dish.new(name: "Fish and chips", price: 10.99),
      Dish.new(name: "Beef wellington", price: 8.99)
    ]
  end
end
