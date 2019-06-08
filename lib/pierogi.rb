require 'menu'
require 'order'

class Pierogi

  attr_reader :food

  def initialize
    @food = []
  end

  def todays_menu(menu = Menu)
    @food << menu
  end

  def show_food
    @food.join('')
  end

end