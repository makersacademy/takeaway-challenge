class Menu
  attr_reader :dishes

  def initialize

    @dishes = []

  end

  def add(dish)

    @dishes << dish

  end

  def print

    @dishes.map { |dish| "#{dish.name}: £#{dish.price}" }.join(" \n")

  end

  def release(dish_name, quantity) 

    dish_to_release = find_dish(dish_name)
    raise "Not on Menu" if dish_to_release.nil? 
    create_dish_container(dish_to_release, quantity) # returns array of the same dish

  end

  private

  def create_dish_container(dish_to_release, quantity)

    dish_container = []
    quantity.times { dish_container << dish_to_release }
    dish_container

  end

  def find_dish(dish_name)

    @dishes.select { |dish| dish.name == dish_name }.first
    
  end

end
