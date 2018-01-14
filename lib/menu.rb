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
end