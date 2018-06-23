class Menu

  attr_reader :options

  MENU = [{dish: "meat", price: 10},{dish: "veg", price: 5}]

  def initialize
    @options = MENU
  end

end
