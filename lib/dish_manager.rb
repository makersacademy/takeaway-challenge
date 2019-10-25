class DishManager
  attr_accessor :available_dishes

  def initialize
    @available_dishes = []
  end

  def find_dish_by_name(name)
    @available_dishes.select { |dish| dish.name == name }.first
  end
end