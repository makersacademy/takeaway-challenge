class Menu

attr_reader :dishes

  def initialize
    @dishes = { "Chicken" => 5, "Lamb" => 8, "Chips" => 2 }
  end

  def show_menu
    @dishes
  end

end
