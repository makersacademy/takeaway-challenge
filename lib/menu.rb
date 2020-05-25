require_relative 'dish'

class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def print_menu
    @dishes
  end

end

