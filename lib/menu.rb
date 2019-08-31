class Menu

  def initialize
    @menu = {}
  end

  def add_dish(dish)
    @menu[dish.name] = dish
  end

  def list_menu
    @menu.values
  end
end
