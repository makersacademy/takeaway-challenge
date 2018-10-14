require_relative 'takeaway'

class Menu

  attr_reader :list

  def initialize
    @list = {
      'margherita' => 8,
      'pepperoni'  => 9,
      'vegetarian' => 9
    }
  end
end
