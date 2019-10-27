class Menu
  DEFAULT_MENU = {Fish: 1.49, Jelly: 0.49, Liver: 1.99, Egg: 0.49}

  def initialize(menu = DEFAULT_MENU)
    @menu = DEFAULT_MENU
  end

  def display_menu
    @menu.map do |food, price|
      "#{food} - £#{price}"
    end.join("\n")
  end

end