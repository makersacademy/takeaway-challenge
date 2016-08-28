require_relative "dish"

class Menu

  def initialize
    @menu = {1012 => Dish.new(1012, "Pizza", 1.99), 1013 => Dish.new(1013, "Burger", 2.11)}
  end

  def get_menu
    menu.dup
  end

  private

  attr_reader :menu
end
