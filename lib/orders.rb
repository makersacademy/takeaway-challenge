require './lib/dishes'

class Orders
  include Dishes

  attr_reader :current

  def initialize
    @current = {}
  end

  def view_menu
    list 
  end

  def choose_dish(dish, quantity)
    @current[dish] = quantity
  end

end
