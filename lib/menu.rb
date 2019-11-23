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
    @dishes.map { |dish| "Name: #{dish.name}, Price: #{dish.price}" }.join("\n")
  end

end
