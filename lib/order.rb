require_relative 'menu'

class Order 
  attr_reader :ordered_food, :menu

  def initialize
    @ordered_food = []
    @menu = Menu.new
  end

  def add_food
    @ordered_food = "Cod £6"
  end

end
