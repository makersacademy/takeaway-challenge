require 'menu'

class Restaurant
  attr_reader :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def design_dish(name, price)
    @menu.add_to_menu(name, price)
  end

  def display_menu
    @menu.compile_menu
  end

  def add_to_order(name)
    selection = select_dish(name)
    return "No dish found" if selection.empty?
    return "Dish not available" unless selection.first.available

    @order += selection
  end

  def dish_unavailable(name)
    selection = select_dish(name)
    return "No dish found" if selection.empty?

    selection.first.not_available
  end

  private

  def select_dish(name)
    @menu.dishes.select { |dish| dish.name == name }  
  end

end
