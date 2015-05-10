class Menu
  attr_accessor :list

  def initialize
  	@list = {"Bottle of Water" => 0, "Disney Themed Napkins (x5) - only Jafar available" => 50, "Carbonara (sauce sold separately)" => 0.4}
  end

  def print_menu
  	list
  end
end


