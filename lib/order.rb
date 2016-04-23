require 'pry'

class Order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def select_dish(quantity)
    selected_dish = @menu.print_menu.pop
    # binding.pry
    selected_dish.quantity = quantity
    selected_dish
  end
end