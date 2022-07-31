class Menu
  attr_reader :menu

  def initialize
    @menu = {
      "curried goat" => 7.50,
      "fried chicken" => 6.50,
      "fried snapper" => 7.00,
      "ackee with sweet peppers" => 6.00,
      "fried plantain" => 2.00,
      "mac and cheese" => 4.00,
      "rice and peas" => 3.00,
      "plain rice" => 2.50,
    }
  end

  def show_menu
    menu
  end
end
