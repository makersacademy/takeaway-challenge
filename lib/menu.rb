require_relative "./dish.rb"

class Menu
  attr_reader :dishes

  def initialize(dish_class = Dish)
    @dishes = []
    @dishes << dish_class.new("Lemon chicken", 515, 81, 1)
  end

  def get_by_id(id) # will give a COPY of the dish with the given id
    @dishes.select { |dish| dish.id == id}.pop
  end

  def list
    dishes.each { |dish| dish.print_dish }
  end
end
