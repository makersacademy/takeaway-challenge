class Menu

  EMPTY_ERR = 'Menu is empty'.freeze
  DUPE_ERR = 'A dish with this name already exists'.freeze
  NO_DISH_ERR = 'This dish isn\'t on the menu'.freeze

  def initialize
    @menu = {}
  end

  def view
    fail EMPTY_ERR if @menu.empty?
    @menu
  end

  def add dish, price
    fail DUPE_ERR if on_menu?(dish)
    @menu[dish.upcase] = price
  end

  def remove dish
    fail NO_DISH_ERR unless on_menu?(dish)
    @menu.delete(dish.upcase)
  end

  private
  def on_menu? dish
    @menu.key?(dish.upcase)
  end

end
