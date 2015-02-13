


class Menu

  attr_accessor :name, :dishes

  def initialize(name)
    @name = name
    @dishes = []
  end

  def add(dish)
    dishes << dish
  end

  def remove(dish)
    dishes.delete(dish)
  end

end
