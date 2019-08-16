#contains Dishes, check whether a dish exists, returns it
class Menu
  attr_reader :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def list
    dishes.each{ |dish| puts "#{dish.name}: #{dish.price}"}
  end

  def contains?(dish_name)
    !dishes.select { |dish| dish.name == dish_name }.empty?
  end

  def dish_from_name(dish_name)
    dishes.select { |dish| dish.name == dish_name }.pop if contains?(dish_name)
  end
end
