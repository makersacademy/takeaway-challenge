require_relative 'take_away'

class KebabVan < TakeAway
  attr_accessor :menu, :time, :name

  def initialize(name)
    @menu = {'Burger' => 2, 'Doner-Kebab' => 4, 'Chips-and-Cheese' => 3, 'Chicken-Kebab' => 5, 'Mixed-Kebab' => 4, 'Chicken-Burger' =>3}
    interactive_menu
  end
end