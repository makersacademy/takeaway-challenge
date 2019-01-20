class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      'pizza' => 9.99,
      'calzone' => 11.50,
      'kebab'=> 4.99,
      'soup' => 5.50,
      'sandwich' => 3.50,
      'garlic bread' => 3.99
    }
  end

  def add_dishes(dish, price)
    @dishes[dish] = price
    @dishes
  end

  def print_menu
    @dishes
  end
end
