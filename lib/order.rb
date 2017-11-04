require_relative 'dishes'

class Order

  def initialize
    @menu = Dishes.new
  end

  def asks_menu
    @menu.print_menu
  end

end
