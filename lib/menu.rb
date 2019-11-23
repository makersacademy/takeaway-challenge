class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    fail "This dish is already in the menu" if @dishes.include? dish

    @dishes.push(dish)
  end

  def list
    formatted_list = @dishes.each_with_index.map do
      |dish, i| "Dish #{i + 1}: #{dish.name}, £#{dish.price}"
    end
    formatted_list.join("\n")
  end

end
