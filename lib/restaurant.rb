require_relative 'menu'

class Restaurant

  attr_reader :menu

  def initialize(menu = Menu.new(Dish))
    @menu = menu
  end

  def display
    @menu.dishes
  end

  def add_dish(name, price, menu = @menu)
    @menu.add_dish(name, price)
  end

  def create_new_menu(name)
    @name = Menu.new(Dish)
    name
  end
end
