require_relative "dish"

class Menu

  def initialize
    @menu_content = {1012 => Dish.new(1012, "Pizza", 1.99),
      1013 => Dish.new(1013, "Burger", 2.11)}
  end

  def menu
    menu_content.dup
  end

  private

  attr_reader :menu_content
end
