class Menu
  attr_accessor :menu_list

  def initialize
  	@menu_list = {"Bottle of Water" => 3.08, "Disney Themed Napkins (x5)" => 50, "Carbonara" => 0.4, "Ice cream" => 0.48, "Happiness" => 0}
  end

  def print_menu
  	menu_list.each do |dish_key, dish_price|
      "#{dish_key}: £#{dish_price}"
  	end
  end
end


#perhaps would need to create module? Check that this is okay...