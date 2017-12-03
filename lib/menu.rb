class Menu
  attr_reader :dishes
  def initialize
    @dishes = {}
  end

  def add_dish(dish)
    dishes[dish.name] = dish
  end

  def to_s
    dishes.map {|name, dish| dish.to_s }.join("\n")
  end

private
attr_writer :dishes

end
