class Menu

  attr_reader :menu

  def initialize
    @menu = {"Fries Bucket" => 4,
             "Onion Ring " => 3,
             "Potato Skin Bag" => 3.50,
             "Big Kahuna Burger" => 7,
             "Triple Cow Burger" => 12,
             "Quadruple Bypass Burger" => 20,
             "Koka Cola" => 3,
             "7down" => 3,
             "Pudweiser" => 4
            }
  end

  def show_menu
    @menu.dup
  end

end