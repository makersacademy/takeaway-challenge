class Menu
  attr_reader :dishes

  def initialize
    @dishes = [Dish.new('Fish and chips', 7), Dish.new('Burger', 8),
      Dish.new('Kebab', 10), Dish.new('Pizza', 12)]
  end

  def find_dish(dish_name)
    result = @dishes.select { |dish| dish.name.casecmp(dish_name).zero? }
    raise 'Dish not found' if result.count.zero?
    result[0]
  end

end
