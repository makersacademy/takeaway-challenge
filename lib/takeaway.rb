require_relative "menu"

class Takeaway

  attr_reader :selected_dishes

  def initialize (menu = Menu.new)
    @menu = menu
    @selected_dishes = []
  end

  def menu_restaurant
    @menu.dishes
  end

  def select_dishes(dish)
  @selected_dishes <<  @menu.dishes.select {
      |key, value| key.to_s.match(dish)
    }
  end
end
