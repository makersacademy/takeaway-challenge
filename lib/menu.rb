class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    fail "This dish is already in the menu" if contains? dish

    @dishes.push(dish)
    "#{dish.name} added to the menu"
  end

  def list
    @dishes.map { |dish| "#{dish.name} (£#{dish.price})" }.join(", ")
  end

  def contains?(dish)
    @dishes.include? dish
  end
end
