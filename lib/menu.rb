class Menu
  attr_accessor :list

  def initialize
  	@list = {"Bottle of Water" => 3.08, "Disney Themed Napkins (x5)" => 50, "Carbonara" => 0.4, "Ice cream" => 0.48, "Happiness" => 0}
  end

  def print_menu
  	list
  end
end


