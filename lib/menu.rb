require_relative 'takeaway'

class Menu

  attr_reader :items

  def initialize
    @items = {
      'thing_one' => 2,
      'thing_two' => 4,
      'thing_three' => 12,
      'thing_four' => 15
    }
  end

end
