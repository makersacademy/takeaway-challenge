class Menu
  attr_reader :list

  def initialize
    @list = {}
  end

  def add dish
    fail 'Dish is already in the menu' if @list[dish.name]
    @list[dish.name] = dish.price
  end

  def remove name
    fail 'Dish is not in the menu' unless @list[name]
    @list.delete(name)
  end
end
