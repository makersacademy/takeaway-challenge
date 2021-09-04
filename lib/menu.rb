class Menu
  attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = []
  end

  def list_menu
    dish = Dish.new #make this a double?
    @list_of_dishes.push(dish.hash)
  end
end