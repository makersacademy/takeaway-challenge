class Menu
  def initialize(dishes)
    @dishes = dishes
  end

  def list_dishes
    dishes.each_with_index.map { |dish, index|
      "#{index + 1}. #{dish}"
    }.join("\n")
  end

  def get_dish(dish_number)
    dishes[dish_number - 1]
  end

  private

  attr_reader :dishes
end
