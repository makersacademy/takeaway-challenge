class FoodOrder
  attr_accessor :basket, :takeaway_menu

  def initialize(takeaway_menu = Menu.new)
    @basket = []
    @takeaway_menu = takeaway_menu
  end

  #TODO return error if a dish on the menu is not selected
  def add_dish(dish)
    selection = takeaway_menu.menu.select { |key, value| key == dish.to_sym }
    basket << selection
  end
end
