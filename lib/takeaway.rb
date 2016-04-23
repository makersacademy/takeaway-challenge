require 'pry'

class Takeaway

  def initialize(menu, order = Order.new(menu))
    @menu = menu
    @order = order
  end

  def show_menu
    @menu.print_menu
  end

  def place_order(dish, quantity)
    fail "The dish is not in the menu" unless has_dish?(dish)
    dish.quantity = quantity
    @order.selected_dishes << dish
    dish
  end

  private

    def has_dish?(dish)
      @menu.dishes.include?(dish)
    end
end