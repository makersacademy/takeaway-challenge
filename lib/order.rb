require_relative 'menu'

class Order 
  attr_reader :ordered_food, :menu, :see_menu

  def initialize
    @ordered_food = []
    @menu = Menu.new
    @see_menu
  end

  def add_food
    @ordered_food = "Cod £6"
  end

end
