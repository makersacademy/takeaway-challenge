class Order
  attr_reader :dishes

  def initialize(menu)
    @dishes = []
    @current_menu = menu
  end

  def select(dish)
    raise "Dish not on menu." unless @current_menu.dishes.include?(dish)
    @dishes << dish
  end

end
