require_relative 'menu'

class Takeaway

  attr_reader :food, :basket

  def initialize(menu_class: Menu)
    @menu = menu_class.new
    @basket = []
  end

  def print_menu
    @menu.food
  end

  def order(food)
    @basket << food_order(food)
  end

  def food_order(food)
    @menu.food.select { |key| key.include?(food)}
  end


end
