require 'pry'

class Order

  def initialize(menu = Menu.new)
    @menu = menu
    @selected_dishes = []
  end

  def show_menu   #extract this to Takeaway class?
    @menu.print_menu
  end

  def select_dish(dish, quantity)
    fail "The dish is not in the menu" unless show_menu.include?(dish)
    @selected_dishes << dish.quantity = quantity
    dish
  end
end