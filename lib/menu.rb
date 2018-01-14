class Menu
  attr_reader :name

  def initialize(name)
    @name = name
    @dishes = []
  end

  def add(dish)
    @dishes << dish unless @dishes.include?(dish)
    self
  end

  def remove(dish)
    @dishes.delete(dish) if @dishes.include?(dish)
    self
  end

  def dishes
    @dishes.dup
  end

  def dish_by_name(name)
    raise "Dish not found in menu" unless dishes.find { |dish| dish.name == name }
    dishes.find { |dish| dish.name == name }
  end
end
