# contains menu data

class Menu

  attr_reader :data

  def initialize(menu = MENU)
    @data = menu
  end

  private 

  MENU = {"Pilau Rice" => 2.20,
             "Egg Fried Rice" => 2.50}

end
