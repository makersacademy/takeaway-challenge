class Menu

  attr_reader :menu

  BIG_BURGER_MENU = {"Fries Bucket" => 4,
             "Onion Ring Ring" => 3,
             "Potato Skin Bag" => 3.50,
             "Big Kahuna Burger" => 7,
             "Triple Cow Burger" => 12,
             "Quadruple Bypass Burger" => 20,
             "Koka Cola" => 3,
             "Seven Down" => 3,
             "Pudweiser" => 4
            }.freeze

  def initialize(menu = BIG_BURGER_MENU)
    @menu = menu
  end

  def show_menu
    @menu.each {|item,  price| "#{item}: £#{price}"}
  end

end