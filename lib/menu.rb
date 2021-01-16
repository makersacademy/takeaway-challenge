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
    raise "Dish does not exist" unless dish_exists?(name)

    dish_from(name)
  end

  private

  def dish_from(name)
    @dishes.select { |dish| dish.name == name }.first
  end

  def dish_exists?(name)
    !@dishes.select { |dish| dish.name == name }.empty?
  end

  def dishes_to_string
    dish_list = ""
    @dishes.each { |dish| dish_list << "#{dish.name}: £#{dish.price}\n" }
    dish_list
  end

end
