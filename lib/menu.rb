require_relative 'meal'

class Menu
  DEFAULT_MENU = {Fish: 1.49, Jelly: 0.49, Liver: 1.99, Egg: 0.49}
  attr_reader :menu
  
  def initialize(menu = DEFAULT_MENU)
    @menu = DEFAULT_MENU
  end

  def display_menu
    @menu.map do |dish, price|
      "#{dish} - £#{price}"
    end.join("\n")
  end

end