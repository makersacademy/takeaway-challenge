class FoodOrder
  attr_accessor :basket

  def initialize
    @basket = []
  end

  def add_dish(dish)
    new_menu = Menu.new
    selection = new_menu.menu.select { |key, value| key == dish.to_sym }
    basket << selection
  end
end
