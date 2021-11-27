class Menu
  attr_accessor :dishes
  def initialize
    @dishes = [
      { dish_name: "mushroom risotto", price: 8 }, { dish_name: "pepperoni pizza", price: 4 }
    ]
  end
end
