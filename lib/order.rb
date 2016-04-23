require 'pry'

class Order

  def initialize(menu = Menu.new)
    @menu = menu
    @selected_dishes = []
  end

  def select_dish(dish, quantity)
    fail "The dish is not in the menu" unless has_dish?(dish)
    @selected_dishes << dish.quantity = quantity
    dish
  end

  private

    def has_dish?(dish)
      @menu.dishes.include?(dish)
    end
end