class Takeaway

  attr_reader :current_order

  def initialize(menu)
    @dishes = menu.dishes
    @current_order = {}
  end

  def show_menu
    @dishes
  end

  def order(dish, quantity = 1)
    raise 'Dish not available: not part of the menu' unless @dishes.include?(dish)
    @current_order.merge!({ dish => quantity })
    end
  end
