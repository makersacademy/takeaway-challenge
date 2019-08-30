class Menu

  MENU = {
  "Lasagne" => 6.50,
  "fried chicken" => 5.50,
  "Ceasar salada" => 3.0,
  "Mac and cheese" => 4.0
  }

  attr_reader :menu

  def initialize(menu = MENU)
  @menu = menu
  end

  def view_menu
    @menu
  end

end
