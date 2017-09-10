require_relative 'menu'

class Order
  def initialize
    @food_order = []
    @menu = Menu.new.italian_menu
  end

  def food_order
    @food_order
  end

  def add(food, price)
    @food_order << {food => price}
  end
end
