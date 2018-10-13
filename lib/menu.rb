require_relative 'takeaway'
require_relative 'basket'

class Menu

  attr_reader :menu

  def initialize
    @menu = {
      'margherita' => 8,
      'pepperoni'  => 9,
      'vegetarian' => 9
    }
  end

  def display
    @menu
  end
end
