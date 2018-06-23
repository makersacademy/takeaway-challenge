class Menu

  attr_reader :options

  MENU = { "meat" => 10, "veg" => 5}

  def initialize
    @options = MENU
  end

end
