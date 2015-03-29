require_relative 'take_away'

class CurryHouse < TakeAway
  attr_accessor :menu, :time, :name

  def initialize(name)
    @menu = {'Duck-Madras' => 9, 'Chicken-Korma' => 6, 'Pilau-Rice' => 3, 'Onion-Bargie' => 2, 'Naan' => 3 }
    interactive_menu
  end
end