class Menu
  attr_reader :dishes

  def initialize
    @dishes = [
      {"Magherita" => "£5.00"},
      {"Pepperoni" => "£8.00"}
    ]
  end

  def view_menu
    @dishes
  end
end
