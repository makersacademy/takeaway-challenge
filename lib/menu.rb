class Menu
  attr_reader :dishes

  def initialize
    @dishes = [Dish.new('Fish and chips', 7), Dish.new('Burger', 8),
      Dish.new('Kebab', 10), Dish.new('Pizza', 12)]
  end

end
