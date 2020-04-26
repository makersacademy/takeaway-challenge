require './lib/menu.rb'

class Interface

  attr_reader :food

  def initialize
    @food = Menu.new
  end

  def food_menu
    @food.menu
  end

end
