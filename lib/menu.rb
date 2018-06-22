class Menu

  attr_reader :options

  MENU = [{food: "meat", price: 10},{food: "veg", price: 5}]

  def initialize
    @options = MENU
  end

end
