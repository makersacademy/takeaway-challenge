class Menu

  def initialize
    @dishes = []
  end

  def add(item)
    @dishes << item
  end

  def print_menu
    @dishes.map.with_index {|dish,index| "#{index +1}. #{print_dish(dish)}"}
  end

  def dishes
    @dishes
  end

  def print_dish(dish)
    "#{dish.name}: £#{dish.price}"
  end

end
