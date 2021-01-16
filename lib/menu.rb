require_relative 'dish'

class Menu

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    check_already_existing(dish.name)
    @dishes << dish
  end

  def list_dishes
    dishes_to_string
  end

  def select_dish(name)
    check_non_existent(name)
    get_dish_from(name)
  end

  def select_price(name)
    check_non_existent(name)
    @dishes.select { |dish| dish.name == name }.first.price
  end

  private

  def check_already_existing(name)
    raise "Dish already exists" if dish_exists?(name)
  end

  def check_non_existent(name)
    raise "Dish does not exist" unless dish_exists?(name)
  end

  def get_dish_from(name)
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
