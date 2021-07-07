class Menu
  attr_reader :menu

  MENU = {
      "Pizza ": 100,
      "Turnips ": 84,
      "Avocados ": 260,
      "Ants ": 43,
      "Jelly ": 187
  }
  def initialize(menu = MENU)
    @menu = menu
  end

  def view
    MENU.map { |dish, price| "#{dish}: £#{sprintf('%.2f', price)}" }
  end

end
