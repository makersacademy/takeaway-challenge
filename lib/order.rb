require_relative './menu.rb'

class Order

  attr_reader :user_order, :menu

  def initialize(menu = Menu.new)
    @user_order = []
    @menu = menu
  end

  def display_menu
    @menu.display
  end

  def generate_order(quantity = 1, dish = Dish.new("1 Argentinian Asado", 12))
    @user_order << [dish, quantity]
  end

end
