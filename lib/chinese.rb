require_relative 'take_away'

class Chinese < TakeAway
  attr_accessor :menu, :time, :name

  def initialize(name)
    @menu = {'Crispy-Duck' => 12, 'Chicken-Satay' => 4, 'Egg-Fried-Rice' => 3, 'Spring-Rolls' => 5, 'Chicken-Chow-Mein' => 6 }
    interactive_menu
  end
end