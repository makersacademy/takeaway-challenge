class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    fail "This dish is already in the menu" if include? dish

    @dishes.push(dish)
    "#{dish.name} added to the menu"
  end

  def list
    @dishes.map { |dish| "Name: #{dish.name}, Price: #{dish.price}" }.join("\n")
  end

  def include?(dish)
    @dishes.include? dish
  end
end
