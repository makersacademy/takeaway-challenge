class Menu
  DEFAULT_MENU = {Fish: 1.49, Jelly: 0.49, Falafel: 1.99, Egg: 0.49}

  def initialize(menu = DEFAULT_MENU)
    @menu = DEFAULT_MENU
  end

  def display_menu
    DEFAULT_MENU
  end

end