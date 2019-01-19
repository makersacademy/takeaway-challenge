class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def print_menu
    dishes.map do |dish|
      "%s £%.2f" % [dish.name, dish.price]
    end.join(", ")
  end

  def has_dish?(dish)
    @dishes.include?(dish)
  end
end
