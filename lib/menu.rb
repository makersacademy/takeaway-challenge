class Menu

  attr_reader :list

  def initialize
    @list = {}

  end

  def add_dish(dish)
    @list[dish.name] = [dish.name , dish.price]
  end

end