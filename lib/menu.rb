require './lib/dishes'

class Menu

  def initialize(dishes = Dishes)
    @dishes = dishes
  end

  def print_menu
    @dishes.print_dishes
  end
end
