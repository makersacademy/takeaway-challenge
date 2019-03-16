require_relative 'food_menu.rb'

class Takeaway

  def initialize(food_menu)
    @food_menu = food_menu
  end

  def see_dishes
    food_menu.print
  end

  attr_reader :food_menu

end