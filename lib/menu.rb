class Menu

  attr_reader :menu

  def initialize
    @menu
  end

  def menu_entries
    @menu = { "Coconut Rice" => 5.45, "Jollof Rice" => 3.89, "Pounded Yam" =>
        3.85, "Dumplings" => 2.14, "Jerk Chicken" => 3.45, "Pepper Soup" => 3.15 }
  end


end
