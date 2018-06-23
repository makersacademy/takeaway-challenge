class Menu

  attr_reader :options

  MENU = { "Meat" => 10, "Veg" => 5 }

  def initialize
    @options = MENU
  end

end
