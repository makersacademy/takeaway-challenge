class Menu

  EMPTY_ERR = 'Menu is empty'.freeze
  DUPE_ERR = 'A dish with this name already exists'.freeze
  NO_DISH_ERR = 'This dish isn\'t on the menu'.freeze

  def initialize dish_class = Dish
    @dish_class = dish_class
    @menu = {}
  end

  def view
    fail EMPTY_ERR if @menu.empty?
    @menu.clone
  end

  def add dish, price
    fail DUPE_ERR if on_menu?(dish)
    @menu[dish.name] = price
  end

  def remove dish
    fail NO_DISH_ERR unless on_menu?(dish)
    @menu.delete(dish.name)
  end

  private
  def on_menu? dish
    @menu.key?(dish.name)
  end

end
