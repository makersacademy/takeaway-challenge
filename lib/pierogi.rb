require 'menu'
require 'order'

class Pierogi

  attr_reader :food

  def initialize
    @food = []
  end

  def todays_menu(menu)
    @food << menu
    nil
  end

  def show_food
    @food[0]
  end

end