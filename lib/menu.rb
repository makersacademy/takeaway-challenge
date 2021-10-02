class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def print
    @dishes.map { |dish| "#{dish.name}: £#{dish.price}" }.join(" \n")
  end

end