class Menu
  attr_reader :dishes
  MENU = [
    { "Magherita" => "£5.00" },
    { "Pepperoni" => "£8.00" }
  ]

  def initialize
    @dishes = MENU
  end

  def view_menu
    @dishes
  end
end
