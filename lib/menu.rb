class Menu

  MENU = { chow_mein:         3.00,
           singapore_noodles: 3.50,
           peking_duck:       5.60,
           egg_fried_rice:    2.00 }

  attr_reader :menu

  def initialize
    @menu = MENU
  end

  def check
  end

  def add_to_order quantity, dish
  end

end