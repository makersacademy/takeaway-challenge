require_relative 'dish'

class Menu

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def list_dishes
    p dishes_to_string
  end

  def select_dish(name)
    raise "Dish does not exist" if @dishes.select { |dish| dish.name == name }.empty?
    @dishes.select { |dish| dish.name == name }.first
  end

  private

  def dishes_to_string
    dish_list = ""
    @dishes.each { |dish| dish_list << "#{dish.name}: £#{dish.price}\n" }
    dish_list
  end

end
